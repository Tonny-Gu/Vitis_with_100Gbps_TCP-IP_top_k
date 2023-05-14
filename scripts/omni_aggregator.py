import asyncio
import numpy as np
import traceback

NUM_CLIENTS = 128
NUM_SLOTS = 4

queue = asyncio.Queue()

class Slot:
    def __init__(self) -> None:
        self.num_workers = 0
        self.agg_pool = np.zeros(15, dtype=np.uint32)
        self.min_blk_id = np.array([1 << 31])
        self.writers: list[asyncio.streams.StreamWriter] = []

    async def broadcast(self):
        for w in self.writers:
            w.write(self.min_blk_id.tobytes())
            w.write(self.agg_pool.tobytes())
            await w.drain()

    def reset(self):
        self.agg_pool = np.zeros(15, dtype=np.uint32)
        self.min_blk_id = np.array([1 << 31], dtype=np.uint32)
        self.writers: list[asyncio.streams.StreamWriter] = []
    
    def reset_all(self, num_workers: int):
        self.reset()
        self.num_workers = num_workers
        
    async def aggregate(self, payload, writer):
        self.writers.append(writer)
        self.agg_pool += payload[1:]
        self.min_blk_id = np.minimum(self.min_blk_id, payload[0:1])
        if len(self.writers) == self.num_workers:
            await self.broadcast()
            self.reset()

async def slot_main():
    slots = [Slot() for _ in range(NUM_SLOTS)]
    while True:
        data, writer = await queue.get()
        data: bytes
        writer: asyncio.streams.StreamWriter
        payload = np.frombuffer(data, dtype=np.uint32)
        reset_bit: int = payload[0] & 0x03
        header_value: int = (payload[0] & 0xFFFFFFFC) >> 2
        # print(payload, reset_bit, header_value)
        if reset_bit == 1:
            for s in slots:
                s.reset_all(header_value)
            writer.write(data)
            await writer.drain()
        else:
            s = slots[header_value % NUM_SLOTS]
            await s.aggregate(payload, writer)
        writer.write(data)
        await writer.drain()

async def on_receive(reader: asyncio.streams.StreamReader, writer: asyncio.streams.StreamWriter):
    try:
        while True:
            data = await reader.read(64)
            if not data:
                break
            await queue.put((data, writer))
            
    except Exception as e:
        print(traceback.format_exc())

    # writer.close()
    # await writer.wait_closed()

async def main():
    asyncio.create_task(slot_main())
    server = await asyncio.start_server(on_receive, '0.0.0.0', 2888)

    addrs = ', '.join(str(sock.getsockname()) for sock in server.sockets)
    print(f'Serving on {addrs}')

    async with server:
        await server.serve_forever()

asyncio.run(main())
# print(commands)
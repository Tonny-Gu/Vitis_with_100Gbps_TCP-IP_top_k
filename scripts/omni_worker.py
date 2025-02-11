import asyncio
import time

NUM_CLIENTS = 8
NUM_SLOTS = 2

def gen_cmd(values: list):
    pad_size = 16 - len(values)
    assert pad_size >= 0
    values = values + [0] * pad_size
    return b''.join([i.to_bytes(4, "little") for i in values])

def gen_header(rst_field: bool, val_field: int):
    return rst_field & 0x3 | (val_field << 2)

async def slot_main(client_id: int, slot_id: int, n_repeat: int, rst: bool):
    reader, writer = await asyncio.open_connection('10.72.138.18', 2888)
    # reader, writer = await asyncio.open_connection('10.72.138.15', 2888)
    if rst:
        cmd = gen_cmd([gen_header(True, NUM_CLIENTS)])
    else:
        cmd = gen_cmd([gen_header(False, slot_id)] + list(range(1, 9)))

    for r in range(n_repeat):
        writer.write(cmd)
        await writer.drain()
        # print("[R%s][W%s][S%s] Sent: %s" % (r, client_id, slot_id, cmd.hex()))
        
        rsp = await reader.read(64)
        # print("[R%s][W%s][S%s] Recv: %s" % (r, client_id, slot_id, rsp.hex()))
    writer.close()
    await writer.wait_closed()

async def worker_main(client_id: int, n_repeat: int):
    await asyncio.gather(*[slot_main(client_id, i, n_repeat, False) for i in range(NUM_SLOTS)])

async def main():
    await slot_main(0, 0, 1, True)
    await asyncio.sleep(0.5)
    start = time.time()
    await asyncio.gather(*[worker_main(i, 100) for i in range(NUM_CLIENTS)])
    end = time.time()
    print(end - start)

for n_workers in (1, 2, 4, 8, 16, 32, 64, 128):
    print("n_worker: %s" % n_workers)
    NUM_CLIENTS = n_workers
    asyncio.run(main())

# print("n_worker: %s" % NUM_CLIENTS)
# asyncio.run(main())
# print(commands)
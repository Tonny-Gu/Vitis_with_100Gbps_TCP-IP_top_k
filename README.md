# OmniReduce-P4 on FPGA

This project is built upon

- [Top-K on FPGA](https://github.com/YangZiyi121/Vitis_with_100Gbps_TCP-IP_top_k)
- [Vitis with 100Gbps TCP/IP](https://github.com/fpgasystems/Vitis_with_100Gbps_TCP-IP)

## File Structure

- [kernel/user_krnl/top_k_krnl/src/hdl/top_k](kernel/user_krnl/top_k_krnl/src/hdl/top_k)/*.v: FPGA Kernel
- [scripts/omni_worker.py](scripts/omni_worker.py): Software Worker
- [scripts/omni_aggregator.py](scripts/omni_aggregator.py): Software Aggregator
- [docs/slides.pdf](docs/slides.pdf): Slides

## Build

```bash
mkdir build
cd build
cmake .. -DFDEV_NAME=u280 -DTCP_STACK_EN=1 -DTCP_STACK_RX_DDR_BYPASS_EN=1 
make installip -j
cd ../
make all TARGET=hw DEVICE=/opt/xilinx/platforms/xilinx_u280_xdma_201920_3/xilinx_u280_xdma_201920_3.xpfm USER_KRNL=top_k_krnl USER_KRNL_MODE=rtl NETH=4 -j
```

## Launch

```bash
# Reset
xbutil reset -d 0000:21:00.1

# Load Kernel
./host/host build_dir.hw.xilinx_u280_xdma_201920_3/network.xclbin

# Launch Python Client
python3 ./scripts/omni_worker.py
```

Note: the default IP address of U280 is `10.72.138.18`. To change the IP address, you should modify [host/top_k_krnl/host.cpp](host/top_k_krnl/host.cpp) and recompile the host kernel.

## 

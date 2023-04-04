
set TopModule "hash_table_top"
set ClockPeriod 3.2
set ClockList ap_clk
set HasVivadoClockPeriod 0
set CombLogicFlag 0
set PipelineFlag 0
set DataflowTaskPipelineFlag 1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 0
set FftOrFirFlag 0
set NbRWValue 1
set intNbAccess 0
set NewDSPMapping 1
set HasDSPModule 0
set ResetLevelFlag 0
set ResetStyle control
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set ResetRegisterNum 0
set FsmEncStyle onehot
set MaxFanout 0
set RtlPrefix {}
set RtlSubPrefix hash_table_top_
set ExtraCCFlags {}
set ExtraCLdFlags {}
set SynCheckOptions {}
set PresynOptions {}
set PreprocOptions {}
set SchedOptions {}
set BindOptions {}
set RtlGenOptions {}
set RtlWriterOptions {}
set CbcGenFlag {}
set CasGenFlag {}
set CasMonitorFlag {}
set AutoSimOptions {}
set ExportMCPathFlag 0
set SCTraceFileName mytrace
set SCTraceFileFormat vcd
set SCTraceOption all
set TargetInfo xcu280:-fsvh2892:-2L-e
set SourceFiles {sc {} c /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/fpga-network-stack/hls/hash_table/hash_table.cpp}
set SourceFlags {sc {} c {{-std=c++11 -I/home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/build/fpga-network-stack/hls/hash_table}}}
set DirectiveFile /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/build/fpga-network-stack/hls/hash_table/hash_table_prj/solution1/solution1.directive
set TBFiles {verilog /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/fpga-network-stack/hls/hash_table/test_hash_table.cpp bc /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/fpga-network-stack/hls/hash_table/test_hash_table.cpp vhdl /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/fpga-network-stack/hls/hash_table/test_hash_table.cpp sc /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/fpga-network-stack/hls/hash_table/test_hash_table.cpp cas /home/yangz0e/Desktop/Vitis_with_100Gbps_TCP-IP_top_k/fpga-network-stack/hls/hash_table/test_hash_table.cpp c {}}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set TBInstNames {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set TBTVFileNotFound {}
set AppFile ../hls.app
set ApsFile solution1.aps
set AvePath ../..
set DefaultPlatform DefaultPlatform
set multiClockList {}
set SCPortClockMap {}
set intNbAccess 0
set PlatformFiles {{DefaultPlatform {xilinx/virtexuplus/virtexuplus}}}
set HPFPO 0

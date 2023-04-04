set moduleName process_udp_512_s
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {process_udp<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ regListenPort int 16 regular {fifo 0}  }
	{ s_axis_rx_data_internal int 1024 regular {fifo 0 volatile } {global 0}  }
	{ rx_udp2shiftFifo int 1024 regular {fifo 1 volatile } {global 1}  }
	{ rx_udpMetaFifo int 49 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "regListenPort", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_rx_data_internal", "interface" : "fifo", "bitwidth" : 1024, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_udp2shiftFifo", "interface" : "fifo", "bitwidth" : 1024, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_udpMetaFifo", "interface" : "fifo", "bitwidth" : 49, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_rx_data_internal_dout sc_in sc_lv 1024 signal 1 } 
	{ s_axis_rx_data_internal_empty_n sc_in sc_logic 1 signal 1 } 
	{ s_axis_rx_data_internal_read sc_out sc_logic 1 signal 1 } 
	{ regListenPort_dout sc_in sc_lv 16 signal 0 } 
	{ regListenPort_empty_n sc_in sc_logic 1 signal 0 } 
	{ regListenPort_read sc_out sc_logic 1 signal 0 } 
	{ rx_udpMetaFifo_din sc_out sc_lv 49 signal 3 } 
	{ rx_udpMetaFifo_full_n sc_in sc_logic 1 signal 3 } 
	{ rx_udpMetaFifo_write sc_out sc_logic 1 signal 3 } 
	{ rx_udp2shiftFifo_din sc_out sc_lv 1024 signal 2 } 
	{ rx_udp2shiftFifo_full_n sc_in sc_logic 1 signal 2 } 
	{ rx_udp2shiftFifo_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_rx_data_internal_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "s_axis_rx_data_internal", "role": "dout" }} , 
 	{ "name": "s_axis_rx_data_internal_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_rx_data_internal", "role": "empty_n" }} , 
 	{ "name": "s_axis_rx_data_internal_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_rx_data_internal", "role": "read" }} , 
 	{ "name": "regListenPort_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "regListenPort", "role": "dout" }} , 
 	{ "name": "regListenPort_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "regListenPort", "role": "empty_n" }} , 
 	{ "name": "regListenPort_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "regListenPort", "role": "read" }} , 
 	{ "name": "rx_udpMetaFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":49, "type": "signal", "bundle":{"name": "rx_udpMetaFifo", "role": "din" }} , 
 	{ "name": "rx_udpMetaFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udpMetaFifo", "role": "full_n" }} , 
 	{ "name": "rx_udpMetaFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udpMetaFifo", "role": "write" }} , 
 	{ "name": "rx_udp2shiftFifo_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1024, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo", "role": "din" }} , 
 	{ "name": "rx_udp2shiftFifo_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo", "role": "full_n" }} , 
 	{ "name": "rx_udp2shiftFifo_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "process_udp_512_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "3", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "3",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "regListenPort", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "regListenPort_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_axis_rx_data_internal", "Type" : "Fifo", "Direction" : "I", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "s_axis_rx_data_internal_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "pu_header_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "pu_header_idx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "pu_header_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_udp2shiftFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udp2shiftFifo_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "metaWritten", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_udpMetaFifo", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udpMetaFifo_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	process_udp_512_s {
		regListenPort {Type I LastRead 1 FirstWrite -1}
		s_axis_rx_data_internal {Type I LastRead 0 FirstWrite -1}
		pu_header_ready {Type IO LastRead -1 FirstWrite -1}
		pu_header_idx {Type IO LastRead -1 FirstWrite -1}
		pu_header_header_V {Type IO LastRead -1 FirstWrite -1}
		rx_udp2shiftFifo {Type O LastRead -1 FirstWrite 3}
		metaWritten {Type IO LastRead -1 FirstWrite -1}
		rx_udpMetaFifo {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "3"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	regListenPort { ap_fifo {  { regListenPort_dout fifo_data 0 16 }  { regListenPort_empty_n fifo_status 0 1 }  { regListenPort_read fifo_update 1 1 } } }
	s_axis_rx_data_internal { ap_fifo {  { s_axis_rx_data_internal_dout fifo_data 0 1024 }  { s_axis_rx_data_internal_empty_n fifo_status 0 1 }  { s_axis_rx_data_internal_read fifo_update 1 1 } } }
	rx_udp2shiftFifo { ap_fifo {  { rx_udp2shiftFifo_din fifo_data 1 1024 }  { rx_udp2shiftFifo_full_n fifo_status 0 1 }  { rx_udp2shiftFifo_write fifo_update 1 1 } } }
	rx_udpMetaFifo { ap_fifo {  { rx_udpMetaFifo_din fifo_data 1 49 }  { rx_udpMetaFifo_full_n fifo_status 0 1 }  { rx_udpMetaFifo_write fifo_update 1 1 } } }
}

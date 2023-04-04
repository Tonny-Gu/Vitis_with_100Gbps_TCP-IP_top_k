set moduleName entry_proc
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {entry_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ myMacAddress int 48 regular  }
	{ myMacAddress_c int 48 regular {fifo 1}  }
	{ regSubNetMask int 32 regular  }
	{ regSubNetMask_c int 32 regular {fifo 1}  }
	{ regDefaultGateway int 32 regular  }
	{ regDefaultGateway_c int 32 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "myMacAddress", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "myMacAddress_c", "interface" : "fifo", "bitwidth" : 48, "direction" : "WRITEONLY"} , 
 	{ "Name" : "regSubNetMask", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "regSubNetMask_c", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "regDefaultGateway", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "regDefaultGateway_c", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
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
	{ myMacAddress sc_in sc_lv 48 signal 0 } 
	{ myMacAddress_c_din sc_out sc_lv 48 signal 1 } 
	{ myMacAddress_c_full_n sc_in sc_logic 1 signal 1 } 
	{ myMacAddress_c_write sc_out sc_logic 1 signal 1 } 
	{ regSubNetMask sc_in sc_lv 32 signal 2 } 
	{ regSubNetMask_c_din sc_out sc_lv 32 signal 3 } 
	{ regSubNetMask_c_full_n sc_in sc_logic 1 signal 3 } 
	{ regSubNetMask_c_write sc_out sc_logic 1 signal 3 } 
	{ regDefaultGateway sc_in sc_lv 32 signal 4 } 
	{ regDefaultGateway_c_din sc_out sc_lv 32 signal 5 } 
	{ regDefaultGateway_c_full_n sc_in sc_logic 1 signal 5 } 
	{ regDefaultGateway_c_write sc_out sc_logic 1 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "myMacAddress", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "myMacAddress", "role": "default" }} , 
 	{ "name": "myMacAddress_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "myMacAddress_c", "role": "din" }} , 
 	{ "name": "myMacAddress_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "myMacAddress_c", "role": "full_n" }} , 
 	{ "name": "myMacAddress_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "myMacAddress_c", "role": "write" }} , 
 	{ "name": "regSubNetMask", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "regSubNetMask", "role": "default" }} , 
 	{ "name": "regSubNetMask_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "regSubNetMask_c", "role": "din" }} , 
 	{ "name": "regSubNetMask_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "regSubNetMask_c", "role": "full_n" }} , 
 	{ "name": "regSubNetMask_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "regSubNetMask_c", "role": "write" }} , 
 	{ "name": "regDefaultGateway", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "regDefaultGateway", "role": "default" }} , 
 	{ "name": "regDefaultGateway_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "regDefaultGateway_c", "role": "din" }} , 
 	{ "name": "regDefaultGateway_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "regDefaultGateway_c", "role": "full_n" }} , 
 	{ "name": "regDefaultGateway_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "regDefaultGateway_c", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "entry_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "myMacAddress", "Type" : "None", "Direction" : "I"},
			{"Name" : "myMacAddress_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "7", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "myMacAddress_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "regSubNetMask", "Type" : "None", "Direction" : "I"},
			{"Name" : "regSubNetMask_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "regSubNetMask_c_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "regDefaultGateway", "Type" : "None", "Direction" : "I"},
			{"Name" : "regDefaultGateway_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : ["0"], "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "regDefaultGateway_c_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	entry_proc {
		myMacAddress {Type I LastRead 0 FirstWrite -1}
		myMacAddress_c {Type O LastRead -1 FirstWrite 0}
		regSubNetMask {Type I LastRead 0 FirstWrite -1}
		regSubNetMask_c {Type O LastRead -1 FirstWrite 0}
		regDefaultGateway {Type I LastRead 0 FirstWrite -1}
		regDefaultGateway_c {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	myMacAddress { ap_none {  { myMacAddress in_data 0 48 } } }
	myMacAddress_c { ap_fifo {  { myMacAddress_c_din fifo_data 1 48 }  { myMacAddress_c_full_n fifo_status 0 1 }  { myMacAddress_c_write fifo_update 1 1 } } }
	regSubNetMask { ap_none {  { regSubNetMask in_data 0 32 } } }
	regSubNetMask_c { ap_fifo {  { regSubNetMask_c_din fifo_data 1 32 }  { regSubNetMask_c_full_n fifo_status 0 1 }  { regSubNetMask_c_write fifo_update 1 1 } } }
	regDefaultGateway { ap_none {  { regDefaultGateway in_data 0 32 } } }
	regDefaultGateway_c { ap_fifo {  { regDefaultGateway_c_din fifo_data 1 32 }  { regDefaultGateway_c_full_n fifo_status 0 1 }  { regDefaultGateway_c_write fifo_update 1 1 } } }
}

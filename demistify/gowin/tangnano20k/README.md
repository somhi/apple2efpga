ERROR (IF0008) : The number(16384) of DFF used to infer "osd_buffer" exceeds the resource limit(15915) of current device(GW2AR-LV18QN88C8/I7)

**osd.v**

```verilog
// Quartus IDE
// (* ramstyle = "no_rw_check" *) reg  [7:0] osd_buffer[2047:0];  // the OSD buffer itself

// Gowin IDE
(* ramstyle = "no_rw_check" *) reg  [7:0] osd_buffer[2047:0]  /* synthesis syn_ramstyle = "distributed_ram" */;  //block_ram

```


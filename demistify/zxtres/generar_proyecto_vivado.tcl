# Create the project and directory structure
create_project -force proyecto_vivado ./ -part xc7a35tfgg484-2
#
# Add sources to the project
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/Board/deca/audio/AUDIO_SPI_CTL_RD.v}
set_property file_type SystemVerilog [get_files  "/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/Board/deca/audio/AUDIO_SPI_CTL_RD.v"]
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/Board/deca/audio/SPI_RAM.v}
set_property file_type SystemVerilog [get_files  "/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/Board/deca/audio/SPI_RAM.v"]
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/Board/deca/audio/audio_i2s.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/Board/deca/hdmi/I2C_Controller.v}
set_property file_type SystemVerilog [get_files  "/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/Board/deca/hdmi/I2C_Controller.v"]
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/Board/deca/hdmi/I2C_HDMI_Config.v}
set_property file_type SystemVerilog [get_files  "/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/Board/deca/hdmi/I2C_HDMI_Config.v"]
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/Board/deca/ulpi/ULPI_PS2.v}
set_property file_type SystemVerilog [get_files  "/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/Board/deca/ulpi/ULPI_PS2.v"]
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/Board/deca/ulpi/PLL_PHASE90.v}
set_property file_type SystemVerilog [get_files  "/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/Board/deca/ulpi/PLL_PHASE90.v"]
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/zxtres/deca_top.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/zxtres/mist_clk.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist_top.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist_sd_card.sv}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/sdram.v}
set_property file_type SystemVerilog [get_files  "/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/sdram.v"]
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/mist.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/user_io.v}
set_property file_type SystemVerilog [get_files  "/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/user_io.v"]
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/data_io.v}
set_property file_type SystemVerilog [get_files  "/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/data_io.v"]
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/mist_video.v}
set_property file_type SystemVerilog [get_files  "/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/mist_video.v"]
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/scandoubler.v}
set_property file_type SystemVerilog [get_files  "/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/scandoubler.v"]
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/osd.v}
set_property file_type SystemVerilog [get_files  "/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/osd.v"]
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/arcade_inputs.v}
set_property file_type SystemVerilog [get_files  "/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/arcade_inputs.v"]
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/rgb2ypbpr.sv}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/cofi.sv}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mist/mist-modules/dac.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/T65/T65_Pack.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/T65/T65_ALU.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/T65/T65_MCode.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/T65/T65.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/R65Cx2.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/video_generator.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/tv_controller.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/timing_generator.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/spram.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/PS2_Ctrl.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/keyboard.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/disk_ii_rom.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/disk_ii.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/apple2.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mockingboard/vol_table_array.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mockingboard/mockingboard.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mockingboard/via6522.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/mockingboard/YM2149.sv}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/controller/substitute_mcu.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/EightThirtyTwo/RTL/eightthirtytwo_pkg.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/EightThirtyTwo/RTL/eightthirtytwo_alu.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/EightThirtyTwo/RTL/eightthirtytwo_shifter.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/EightThirtyTwo/RTL/eightthirtytwo_aligner.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/EightThirtyTwo/RTL/eightthirtytwo_aligner_le.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/EightThirtyTwo/RTL/eightthirtytwo_decode.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/EightThirtyTwo/RTL/eightthirtytwo_fetchloadstore.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/EightThirtyTwo/RTL/eightthirtytwo_hazard.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/EightThirtyTwo/RTL/eightthirtytwo_debug.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/EightThirtyTwo/RTL/eightthirtytwo_cpu.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/EightThirtyTwo/RTL/altera/debug_bridge_jtag.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/EightThirtyTwo/RTL/altera/debug_virtualjtag.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/EightThirtyTwo/RTL/debug_fifo.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/firmware/controller_rom.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/controller/simple_uart.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/controller/jtag_uart.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/controller/io_ps2_com.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/controller/interrupt_controller.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/controller/timer_controller.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/DeMiSTify/controller/spi_controller.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/demistify_config_pkg.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/firmware/controller_rom1_byte.vhd}
add_files -fileset sources_1 {/home/jordi/Documents/Coding/Github/gowin_stuff/Apple2efpga/firmware/controller_rom2_byte.vhd}
add_files -fileset sources_1 {./defs.vh}
add_files -fileset sources_1 {./build_id.vh}
add_files -fileset constrs_1 {./zxtres.xdc}
set_property IS_GLOBAL_INCLUDE true [get_files ./defs.vh]
set_property IS_GLOBAL_INCLUDE true [get_files ./build_id.vh]

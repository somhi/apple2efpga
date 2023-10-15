
create_clock -name {clk_50} -period 37.037 { SYS_CLK }

create_generated_clock -name spiclk -source [get_ports CLK_50] -divide_by 16 [get_pins controller/spi/sck_reg/Q]

set hostclk { clk_50 }
set supportclk { clk_50 }
set topmodule "guest/"

# Set pin definitions for downstream constraints
set RAM_CLK DRAM_CLK
set RAM_OUT {DRAM_DQ* DRAM_ADDR* DRAM_BA* DRAM_RAS_N DRAM_CAS_N DRAM_WE_N DRAM_*DQM DRAM_CS_N DRAM_CKE}
set RAM_IN {DRAM_D*}

set VGA_OUT {VGA_R[*] VGA_G[*] VGA_B[*] VGA_HS VGA_VS}

# non timing-critical pins would be in the "FALSE_IN/OUT" collection (IN inputs, OUT outputs)
set FALSE_OUT {LED* PWM_AUDIO_* PS2_* JOYX_SEL_O UART_TXD SD_CS_N_O SD_MOSI_O SD_SCLK_O}
set FALSE_IN  {SW* PS2_* JOY1* EAR UART_RXD SD_MISO_I}


#**************************************************************
# Time Information
#**************************************************************

#set_time_format -unit ns -decimal_places 3

#**************************************************************
# Set Clock 
#**************************************************************

# set sysclk ${topmodule}pll|altpll_component|auto_generated|pll1|clk[0]
# set subclk ${topmodule}pll|altpll_component|auto_generated|pll1|clk[1]
# set sdram_clk ${topmodule}pll|altpll_component|auto_generated|pll1|clk[0]
set sysclk "clk_out1_clk_wiz_0"
set subclk "clk_out2_clk_wiz_0"
set sdram_clk "clk_out1_clk_wiz_0"

set_clock_groups -asynchronous -group [get_clocks $subclk] -group spiclk
set_clock_groups -asynchronous -group [get_clocks $sysclk] -group spiclk
set_clock_groups -asynchronous -group [get_clocks $subclk] -group [get_clocks $supportclk]
set_clock_groups -asynchronous -group [get_clocks $sysclk] -group [get_clocks $supportclk]

#**************************************************************
# Set Input Delay
#**************************************************************
#set_input_delay -clock [get_clocks $sysclk] -max 6.4 [get_ports $RAM_IN]
#set_input_delay -clock [get_clocks $sysclk] -min 3.2 [get_ports $RAM_IN]
set_input_delay -clock [get_clocks $sdram_clk] -reference_pin [get_ports ${RAM_CLK}] -max 6.4 [get_ports ${RAM_IN}]
set_input_delay -clock [get_clocks $sdram_clk] -reference_pin [get_ports ${RAM_CLK}] -min 3.2 [get_ports ${RAM_IN}]

#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -clock [get_clocks $sdram_clk] -reference_pin [get_ports ${RAM_CLK}] -max 1.5 [get_ports ${RAM_OUT}]
set_output_delay -clock [get_clocks $sdram_clk] -reference_pin [get_ports ${RAM_CLK}] -min -0.8 [get_ports ${RAM_OUT}]
#set_output_delay -clock [get_clocks $sysclk] -max 1.5 [get_ports $RAM_OUT]
#set_output_delay -clock [get_clocks $sysclk] -min -0.8 [get_ports $RAM_OUT]


#**************************************************************
# Set Clock Groups
#**************************************************************

#**************************************************************
# Set False Path
#**************************************************************

set_false_path -to ${VGA_OUT}
set_false_path -to ${FALSE_OUT}
set_false_path -from ${FALSE_IN}


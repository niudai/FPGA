  #input
  
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF];
set_property -dict { PACKAGE_PIN T8    IOSTANDARD LVCMOS18 } [get_ports { clk }]; #IO_L24N_T3_34 Sch=sw[8]    
#set_property -dict {PACKAGE_PIN E3  IOSTANDARD LVCMOS33} [get_ports {clk}];
#create_clock -add -name sys_clk_pin -period 1000000000.00 \
#    -waveform {0 5} [get_ports {clock}];
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { f0[0] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { f0[1] }]; #IO_L3N_T0_DQS_EMCCLK_14 Sch=sw[1]
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { f1[0] }]; #IO_L6N_T0_D08_VREF_14 Sch=sw[2]
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { f1[1] }]; #IO_L13N_T2_MRCC_14 Sch=sw[3]
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { rst }]; #IO_L12N_T1_MRCC_14 Sch=sw[4]

# output

set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { fn[0] }]; #IO_L18P_T2_A24_15 Sch=fn[0]
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { fn[1] }]; #IO_L24P_T3_RS1_15 Sch=fn[1]
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { fn[2] }]; #IO_L17N_T2_A25_15 Sch=fn[2]
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { fn[3] }]; #IO_L8P_T1_D11_14 Sch=fn[3]
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { fn[4] }]; #IO_L7P_T1_D09_14 Sch=fn[4]
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { fn[5] }]; #IO_L18N_T2_A11_D27_14 Sch=fn[5]
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { fn[6] }]; #IO_L17P_T2_A14_D30_14 Sch=fn[6]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { fn[7] }]; #IO_L18P_T2_A12_D28_14 Sch=fn[7]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { fn[8] }]; #IO_L16N_T2_A15_D31_14 Sch=fn[8]
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { fn[9] }]; #IO_L14N_T2_SRCC_14 Sch=fn[9]
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { fn[10] }]; #IO_L22P_T3_A05_D21_14 Sch=fn[10]
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { fn[11] }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=fn[11]
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { fn[12] }]; #IO_L16P_T2_CSI_B_14 Sch=fn[12]
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { fn[13] }]; #IO_L22N_T3_A04_D20_14 Sch=fn[13]
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { fn[14] }]; #IO_L20N_T3_A07_D23_14 Sch=fn[14]
set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { fn[15] }]; #IO_L21N_T3_DQS_A06_D22_14 Sch=fn[15]
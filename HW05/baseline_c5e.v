//--------------------------------------------------------------------------//
// Title:        baseline_c5e.v                                       //
// Rev:          Rev 0.2                                                    //
// Last Revised: 08/27/2015                                                 //
//--------------------------------------------------------------------------//
// Description: Baseline design file contains Cyclone V E Dev Kit    				 //
//              Board pins and I/O Standards.                               //
//--------------------------------------------------------------------------//
//Copyright 2012 Altera Corporation. All rights reserved.  Altera products
//are protected under numerous U.S. and foreign patents, maskwork rights,
//copyrights and other intellectual property laws.
//                 
//This reference design file, and your use thereof, is subject to and
//governed by the terms and conditions of the applicable Altera Reference
//Design License Agreement.  By using this reference design file, you
//indicate your acceptance of such terms and conditions between you and
//Altera Corporation.  In the event that you do not agree with such terms and
//conditions, you may not use the reference design file. Please promptly                         
//destroy any copies you have made.
//
//This reference design file being provided on an "as-is" basis and as an
//accommodation and therefore all warranties, representations or guarantees
//of any kind (whether express, implied or statutory) including, without
//limitation, warranties of merchantability, non-infringement, or fitness for
//a particular purpose, are specifically disclaimed.  By making this
//reference design file available, Altera expressly does not recommend,
//suggest or require that this reference design file be used in combination 
//with any other product not provided by Altera
//----------------------------------------------------------------------------


//Group Enable Definition
//This lists each pinouts group
//Users can disable any group by commenting the corresponding line
`define ENABLE_CLK
`define ENABLE_DDR3
`define ENABLE_LPDDR2
`define ENABLE_HSMC
`define ENABLE_ETHERNET_A
`define ENABLE_ETHERNET_B
`define ENABLE_FLASH_AND_SSRAM
`define ENABLE_MAX_V
`define ENABLE_USB
`define ENABLE_LCD
`define ENABLE_LED
`define ENABLE_DIP
`define ENABLE_BUTTON
`define ENABLE_FAN
`define ENABLE_HEADER
`define ENABLE_EEPROM
`define ENABLE_UART
`define ENABLE_USB_UART


module baseline_c5e (


//Clock
	//IO: 7
	`ifdef ENABLE_CLK
	input 						diff_clkin_top_125_p,			//LVDS
	input 						diff_clkin_bot_125_p,			//LVDS
	input							clkin_50_fpga_right,				//2.5V
	input							clkin_50_fpga_top,				//2.5V
	output 						clkout_sma,							//2.5V
   `endif

//DDR3 x32 Devices Interface
	//IO: 71
	`ifdef ENABLE_DDR3
	output						ddr3_ck_p,			//DIFFERENTIAL 1.5-V SSTL CLASS I
	output						ddr3_ck_n,			//DIFFERENTIAL 1.5-V SSTL CLASS I
	inout				[31:0]	ddr3_dq,				//SSTL-15 CLASS I
	inout				[3:0]		ddr3_dqs_p,			//DIFFERENTIAL 1.5-V SSTL CLASS I
	inout				[3:0]		ddr3_dqs_n,			//DIFFERENTIAL 1.5-V SSTL CLASS I
	output			[3:0]		ddr3_dm,				//SSTL-15 CLASS I
	output			[13:0]	ddr3_a,				//SSTL-15 CLASS I
	output			[2:0]		ddr3_ba,				//SSTL-15 CLASS I
	output						ddr3_casn,			//SSTL-15 CLASS I
	output						ddr3_rasn,			//SSTL-15 CLASS I
	output						ddr3_cke,			//SSTL-15 CLASS I
	output						ddr3_csn,			//SSTL-15 CLASS I
	output						ddr3_odt,			//SSTL-15 CLASS I
	output						ddr3_wen,			//SSTL-15 CLASS I	
	output						ddr3_rstn,			//1.5V
	input							ddr3_oct_rzq,		//1.5V	
	`endif
	
//LPDDR2 x16 Devices Interface
	//IO: 37
	`ifdef ENABLE_LPDDR
	output						lpddr2_ck_p,		//DIFFERENTIAL 1.2-V HSUL
	output						lpddr2_ck_n,		//DIFFERENTIAL 1.2-V HSUL
	inout				[15:0]	lpddr2_dq,			//1.2-V HSUL
	inout				[1:0]		lpddr2_dqs_p,		//DIFFERENTIAL 1.2-V HSUL
	inout				[1:0]		lpddr2_dqs_n,		//DIFFERENTIAL 1.2-V HSUL
	output			[1:0]		lpddr2_dm,			//1.2-V HSUL
	output			[9:0]		lpddr2_a,			//1.2-V HSUL
	output						lpddr2_cke,			//1.2-V HSUL
	output						lpddr2_csn,			//1.2-V HSUL
	input							lpddr2_oct_rzq,	//1.2V	
	`endif
	
//HIGH-SPEED-MEZZANINE-CARD Interface	
	//IO: 85
	`ifdef ENABLE_HSMC
	inout          			hsmc_sda,         //2.5V    
	output       				hsmc_scl,         //2.5V 
	input							hsmc_prsntn,		//2.5V   
	output						hsmc_clk_out0,	   //2.5V
	input							hsmc_clk_in0,	   //2.5V
	output 			[2:1]		hsmc_clk_out_p,	//LVDS
	//output 		[2:1]		hsmc_clk_out_n,	//LVDS
	input  			[2:1]		hsmc_clk_in_p,		//LVDS
	//input  		[2:1]		hsmc_clk_in_n,		//LVDS
	inout 			[3:0]		hsmc_d,				//2.5V
	output 			[16:0]	hsmc_tx_d_p,		//LVDS
	//inout 			[16:0]	hsmc_tx_d_n,		//LVDS
	input 			[16:0]	hsmc_rx_d_p,		//LVDS
	//inout 			[16:0]	hsmc_rx_d_n,		//LVDS
	output						hsmc_rx_led,		//2.5V
	output						hsmc_tx_led,		//2.5V
	`endif
	
//Ethernet A PHY interface	
	//IO: 22
	`ifdef ENABLE_ETHERNET_A
	input							eneta_intn,			//2.5V
	output						eneta_resetn,		//2.5V
	output						eneta_mdio,			//2.5V
	output						eneta_mdc,			//2.5V
	//MII
	input							eneta_rx_er,		//2.5V
	output						eneta_tx_er,		//2.5V
	input							eneta_rx_col,		//2.5V
	input							eneta_rx_crs,		//2.5V
	output						eneta_tx_clk,		//2.5V
	//RGMII
	output			[3:0]		eneta_tx_d,			//2.5V
	input				[3:0]		eneta_rx_d,			//2.5V
	output						eneta_gtx_clk,		//2.5V
	output 						eneta_tx_en,		//2.5V
	input							eneta_rx_clk,		//2.5V
	input							eneta_rx_dv,		//2.5V
	`endif
	
//Ethernet B PHY interface	
	//IO: 22
	`ifdef ENABLE_ETHERNET_B
	input							enetb_intn,			//2.5V
	output						enetb_resetn,		//2.5V
	output						enetb_mdio,			//2.5V
	output						enetb_mdc,			//2.5V
	//MII
	input							enetb_rx_er,		//2.5V
	output						enetb_tx_er,		//2.5V
	input							enetb_rx_col,		//2.5V
	input							enetb_rx_crs,		//2.5V
	output						enetb_tx_clk,		//2.5V
	//RGMII
	output			[3:0]		enetb_tx_d,			//2.5V
	input				[3:0]		enetb_rx_d,			//2.5V
	output						enetb_gtx_clk,		//2.5V
	output 						enetb_tx_en,		//2.5V
	input							enetb_rx_clk,		//2.5V
	input							enetb_rx_dv,		//2.5V
	`endif
		
//FLASH & SSRAM INTERFACE 
	//IO: 56
	`ifdef ENABLE_FLASH_AND_SSRAM
	//SSRAM
   output  			[26:1] 	fm_a,             //2.5V 		  	
	inout   			[15:0] 	fm_d,             //2.5V 
	                                          //MSB addresses upper device U11, else lower U10
	                                          //suedo double-wide x16 || x16 = x32 data width
	                                          //32 bit 512Mbit device needs 25 address [25:1]
                                             //32 bit 1Gbit device needs 26 address [26:1] 
	                                          //drop A0(32 bit interface)
	output          			flash_wen,        //2.5V 
	output          			flash_oen,        //2.5V 
	output  					 	flash_cen, 			//2.5V
	                                          //cen[1] upper device U11 & cen[0] lower U10 will be common
	output           			flash_advn,       //2.5V 
	output          			flash_clk,        //2.5V 
	output          			flash_resetn,     //2.5V 
	output  					   flash_rdybsyn,    //2.5V 
	//FLASH
	output           			ssram_clk,        //2.5V
	output          			ssram_oen,        //2.5V
	output          			sram_cen,         //2.5V
	output          			ssram_bwen,       //2.5V
	output  					 	ssram_bwan,       //2.5V
	output  					 	ssram_bwbn,       //2.5V
	output           			ssram_adscn,      //2.5V
	output           			ssram_adspn,      //2.5V
	output          			ssram_zzn,        //2.5V
	output          			ssram_advn,       //2.5V
	//output  		[1:0]		ssram_dqpn,       //2.5V
	`endif
	
//MAX V INTERFACE 
	//IO: 8
	`ifdef ENABLE_MAX_V
	output          			max5_csn,         //2.5V
	output           			max5_wen,         //2.5V
	output           			max5_oen,         //2.5V
	output  			[3:0] 	max5_ben,         //2.5V
	output           			max5_clk,  			//2.5V
	                                          // same as sys_clk (100MHz) net = MAX2_CLK MaxII  pin_ (fm_clk)
	`endif
	
//USB Blaster II
	//IO: 20
	`ifdef ENABLE_USB
	input							usb_clk,				//2.5V
	output			[7:0]		usb_data,			//2.5V
	output			[1:0]		usb_addr,			//2.5V
	inout							usb_scl,				//2.5V
	output						usb_sda,				//2.5V
	output						usb_resetn,			//2.5V
	output						usb_oen,				//2.5V
	output						usb_rdn,				//2.5V
	output						usb_wrn,				//2.5V
	output						usb_full,			//2.5V
	output						usb_empty,			//2.5V
	output						fx2_resetn,			//2.5V
	`endif
	
//CHARACTER LCD 
	//IO: 11	
	`ifdef ENABLE_LCD
	inout   			[ 7:0]   lcd_data,			//2.5V
	output          			lcd_wen,				//2.5V
	output          			lcd_csn,				//2.5V
	output           			lcd_d_cn, 			//2.5V
	`endif
	
//USER LED
	//IO: 4
	`ifdef ENABLE_LED
	output  			[3:0] 	user_led,			//2.5V
	`endif

//USER DIP 
	//IO: 5
	`ifdef ENABLE_DIP
	input   			[3:0] 	user_dipsw,			//2.5V
	input 						dip_3p3V,			//3.3V
	`endif
	
//USER PUSH BUTTON 
	//IO: 4
	`ifdef ENABLE_BUTTON
	input   			[3:0] 	user_pb,				//2.5V
	`endif
	
//Fan Control
	//IO: 1
	`ifdef ENABLE_FAN
	output						overtemp_fpga,		//2.5V
	`endif
		
//GPIO Header
	//IO: 20
	`ifdef ENABLE_HEADER
	inout 			[5:0]		header_p,				//2.5V
	inout 			[5:0]		header_n,				//2.5V
	inout				[7:0]		header_d,				//1.5V
	`endif
	
//EEPROM Interface
	//IO: 2
	`ifdef ENABLE_EEPROM
	output						eeprom_scl,				//3.3V
	inout							eeprom_sda,				//3.3V
	`endif
	
//UART Interface
	//IO:	4
	`ifdef ENABLE_UART
	input 						uart_rxd,				//3.3V
	input							uart_rts,				//3.3V
	output						uart_txd,				//3.3V
	output						uart_cts,				//3.3V
	`endif
	
//USB UART Interface
	//IO: 12
	`ifdef ENABLE_USB_UART
	inout							usb_uart_rstn,			//2.5V
	input							usb_uart_ri,			//2.5V
	input							usb_uart_dcd,			//2.5V
	output						usb_uart_dtr,			//2.5V
	input							usb_uart_dsr,			//2.5V
	output						usb_uart_txd,			//2.5V
	input							usb_uart_rxd,			//2.5V
	input 						usb_uart_rts,			//2.5V
	output						usb_uart_cts,			//2.5V
	input							usb_uart_gpio2,		//2.5V
	input							usb_uart_suspend,		//2.5V
	input							usb_uart_suspendn		//2.5V
	`endif
	
	
	);
endmodule	
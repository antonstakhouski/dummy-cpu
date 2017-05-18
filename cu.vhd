-- Copyright (C) 1991-2010 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II"
-- VERSION		"Version 9.1 Build 350 03/24/2010 Service Pack 2 SJ Web Edition"
-- CREATED		"Mon May 15 15:03:52 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY cu IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		data :  INOUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		Address :  OUT  STD_LOGIC_VECTOR(10 DOWNTO 0);
		control :  OUT  STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END cu;

ARCHITECTURE bdf_type OF cu IS 

ATTRIBUTE black_box : BOOLEAN;
ATTRIBUTE noopt : BOOLEAN;

COMPONENT busmux_0
	PORT(sel : IN STD_LOGIC;
		 dataa : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(10 DOWNTO 0));
END COMPONENT;
ATTRIBUTE black_box OF busmux_0: COMPONENT IS true;
ATTRIBUTE noopt OF busmux_0: COMPONENT IS true;

COMPONENT lpm_bustri5
	PORT(enabledt : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 tridata : INOUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_decode2
	PORT(data : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 eq0 : OUT STD_LOGIC;
		 eq1 : OUT STD_LOGIC;
		 eq2 : OUT STD_LOGIC;
		 eq3 : OUT STD_LOGIC;
		 eq4 : OUT STD_LOGIC;
		 eq5 : OUT STD_LOGIC;
		 eq6 : OUT STD_LOGIC;
		 eq7 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT lpm_decode3
	PORT(data : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 eq0 : OUT STD_LOGIC;
		 eq1 : OUT STD_LOGIC;
		 eq2 : OUT STD_LOGIC;
		 eq3 : OUT STD_LOGIC;
		 eq4 : OUT STD_LOGIC;
		 eq5 : OUT STD_LOGIC;
		 eq6 : OUT STD_LOGIC;
		 eq7 : OUT STD_LOGIC;
		 eq8 : OUT STD_LOGIC;
		 eq9 : OUT STD_LOGIC;
		 eq10 : OUT STD_LOGIC;
		 eq11 : OUT STD_LOGIC;
		 eq12 : OUT STD_LOGIC;
		 eq13 : OUT STD_LOGIC;
		 eq14 : OUT STD_LOGIC;
		 eq15 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT lpm_counter2
	PORT(sclr : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_dff1
	PORT(clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_bustri0
	PORT(enabledt : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 tridata : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_dff3
	PORT(clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_add_sub0
	PORT(dataa : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_add_sub1
	PORT(dataa : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	address_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	and_d :  STD_LOGIC;
SIGNAL	and_u :  STD_LOGIC;
SIGNAL	com :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	com_address :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	dec_d :  STD_LOGIC;
SIGNAL	dec_u :  STD_LOGIC;
SIGNAL	do_com1 :  STD_LOGIC;
SIGNAL	do_com2 :  STD_LOGIC;
SIGNAL	hlt :  STD_LOGIC;
SIGNAL	instruction :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	jmp :  STD_LOGIC;
SIGNAL	jmp_c :  STD_LOGIC;
SIGNAL	js :  STD_LOGIC;
SIGNAL	mov :  STD_LOGIC;
SIGNAL	mov_rm :  STD_LOGIC;
SIGNAL	movmr :  STD_LOGIC;
SIGNAL	movrr_u :  STD_LOGIC;
SIGNAL	nand_d :  STD_LOGIC;
SIGNAL	nand_u :  STD_LOGIC;
SIGNAL	notclk :  STD_LOGIC;
SIGNAL	pop :  STD_LOGIC;
SIGNAL	push :  STD_LOGIC;
SIGNAL	ram_enable :  STD_LOGIC;
SIGNAL	read_com :  STD_LOGIC;
SIGNAL	read_com1 :  STD_LOGIC;
SIGNAL	read_com2 :  STD_LOGIC;
SIGNAL	reg_read :  STD_LOGIC;
SIGNAL	reg_write :  STD_LOGIC;
SIGNAL	ror_d :  STD_LOGIC;
SIGNAL	ror_u :  STD_LOGIC;
SIGNAL	wait :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(10 DOWNTO 0);


BEGIN 
SYNTHESIZED_WIRE_14 <= '0';



b2v_inst : lpm_bustri5
PORT MAP(enabledt => read_com,
		 data => com_address,
		 tridata => address_ALTERA_SYNTHESIZED);


b2v_inst1 : lpm_bustri5
PORT MAP(enabledt => SYNTHESIZED_WIRE_0,
		 data => instruction(10 DOWNTO 0),
		 tridata => address_ALTERA_SYNTHESIZED);


b2v_inst10 : lpm_decode2
PORT MAP(data => SYNTHESIZED_WIRE_1,
		 eq0 => read_com1,
		 eq1 => read_com2,
		 eq2 => wait,
		 eq3 => do_com1,
		 eq4 => do_com2);


b2v_inst11 : lpm_bustri5
PORT MAP(enabledt => SYNTHESIZED_WIRE_2,
		 data => instruction(31 DOWNTO 21),
		 tridata => address_ALTERA_SYNTHESIZED);


b2v_inst13 : lpm_decode3
PORT MAP(data => instruction(3 DOWNTO 0),
		 eq6 => jmp);

instruction(31 DOWNTO 16) <= SYNTHESIZED_WIRE_3;


instruction(15 DOWNTO 0) <= SYNTHESIZED_WIRE_4;



b2v_inst16 : lpm_counter2
PORT MAP(sclr => SYNTHESIZED_WIRE_5,
		 clock => CLK,
		 q => SYNTHESIZED_WIRE_1);


read_com <= read_com2 OR read_com1;


b2v_inst18 : lpm_dff1
PORT MAP(clock => CLK,
		 enable => wait,
		 data => data,
		 q => SYNTHESIZED_WIRE_4);


b2v_inst19 : lpm_dff1
PORT MAP(clock => CLK,
		 enable => read_com2,
		 data => data,
		 q => SYNTHESIZED_WIRE_3);


SYNTHESIZED_WIRE_20 <= wait OR read_com;


b2v_inst20 : lpm_dff1
PORT MAP(clock => CLK,
		 enable => SYNTHESIZED_WIRE_6,
		 data => data,
		 q => SYNTHESIZED_WIRE_11);


SYNTHESIZED_WIRE_21 <= jmp_c AND do_com1;


SYNTHESIZED_WIRE_7 <= jmp_c AND do_com1;


SYNTHESIZED_WIRE_5 <= SYNTHESIZED_WIRE_7 OR do_com2;



SYNTHESIZED_WIRE_16 <= NOT(SYNTHESIZED_WIRE_20);




reg_read <= mov AND do_com1;


SYNTHESIZED_WIRE_0 <= do_com1 AND mov;



jmp_c <= do_com1 AND jmp;


SYNTHESIZED_WIRE_12 <= read_com OR SYNTHESIZED_WIRE_21;


b2v_inst36 : lpm_bustri0
PORT MAP(enabledt => SYNTHESIZED_WIRE_10,
		 data => SYNTHESIZED_WIRE_11,
		 tridata => data);


b2v_inst39 : lpm_dff3
PORT MAP(clock => CLK,
		 enable => SYNTHESIZED_WIRE_12,
		 data => SYNTHESIZED_WIRE_13,
		 q => com_address);


SYNTHESIZED_WIRE_2 <= do_com2 AND mov;


b2v_inst40 : lpm_add_sub0
PORT MAP(dataa => com_address,
		 result => SYNTHESIZED_WIRE_18);


b2v_inst42 : lpm_add_sub1
PORT MAP(dataa => com_address,
		 datab => instruction(14 DOWNTO 4),
		 result => SYNTHESIZED_WIRE_19);

com(4) <= reg_read;


com(5) <= CLK;



SYNTHESIZED_WIRE_10 <= do_com2 AND mov;

com(2) <= SYNTHESIZED_WIRE_14;


com(1) <= SYNTHESIZED_WIRE_20;


com(0) <= SYNTHESIZED_WIRE_16;



b2v_inst6 : busmux_0
PORT MAP(sel => SYNTHESIZED_WIRE_21,
		 dataa => SYNTHESIZED_WIRE_18,
		 datab => SYNTHESIZED_WIRE_19,
		 result => SYNTHESIZED_WIRE_13);

com(3) <= reg_write;



SYNTHESIZED_WIRE_6 <= do_com1 AND mov;



Address <= address_ALTERA_SYNTHESIZED;
control <= com;

mov <= '0';
reg_write <= '0';
END bdf_type;
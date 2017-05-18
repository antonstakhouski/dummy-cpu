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
-- CREATED		"Mon May 15 15:03:27 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ram_block IS 
	PORT
	(
		address :  IN  STD_LOGIC_VECTOR(10 DOWNTO 0);
		control :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		data :  INOUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END ram_block;

ARCHITECTURE bdf_type OF ram_block IS 

ATTRIBUTE black_box : BOOLEAN;
ATTRIBUTE noopt : BOOLEAN;

COMPONENT lpm_ram_io_0
	PORT(outclock : IN STD_LOGIC;
		 memenab : IN STD_LOGIC;
		 inclock : IN STD_LOGIC;
		 we : IN STD_LOGIC;
		 outenab : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
);
END COMPONENT;
ATTRIBUTE black_box OF lpm_ram_io_0: COMPONENT IS true;
ATTRIBUTE noopt OF lpm_ram_io_0: COMPONENT IS true;

SIGNAL	addr :  STD_LOGIC_VECTOR(10 DOWNTO 0);
SIGNAL	clk :  STD_LOGIC;
SIGNAL	con :  STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL	R :  STD_LOGIC;
SIGNAL	RAMen :  STD_LOGIC;
SIGNAL	W :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;


BEGIN 



b2v_inst : lpm_ram_io_0
PORT MAP(outclock => clk,
		 memenab => RAMen,
		 inclock => SYNTHESIZED_WIRE_0,
		 we => W,
		 outenab => R,
		 address => addr,
		 dio => data);


SYNTHESIZED_WIRE_0 <= NOT(clk);



R <= NOT(W);


clk <= con(5);


RAMen <= con(1);


W <= con(2);


con <= control;
addr <= address;

END bdf_type;
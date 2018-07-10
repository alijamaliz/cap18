----------------------------------------------------------------------------------
-- Company:    IUST
-- Engineer:    Ali Jamali
-- 
-- Create Date:    21:12:58 07/10/2018 
-- Design Name:    Instruction Memory
-- Module Name:    instruction_memory - Behavioral 
-- Project Name:    CAP18 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity instruction_memory is
    Port ( program_counter : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           instruction : out  STD_LOGIC_VECTOR(15 DOWNTO 0));
end instruction_memory;

architecture Behavioral of instruction_memory is
signal address: STD_LOGIC_VECTOR(14 DOWNTO 0);
type inst_mem is array(0 TO 12) of STD_LOGIC_VECTOR(15 DOWNTO 0);
signal instructions: inst_mem := (
    "1011010000000000",
	"1100000000000000",
	"0011001010001111",
	"0011011010011110",
	"0111010000000000",
	"0000001001010000",
	"0111010000000001",
	"0000001001010000",
	"0111010000000010",
	"0000001001010000",
	"1101000001011000",
	"1110111111110100",
	"1111000000001101"
);

begin
address <= program_counter(15 DOWNTO 1);
instruction <= instructions(to_integer(unsigned(address)));
end Behavioral;
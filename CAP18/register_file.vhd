----------------------------------------------------------------------------------
-- Company:		IUST
-- Engineer: 	Ali Jamali
-- 
-- Create Date:    22:12:39 07/10/2018 
-- Design Name: 	 Register File
-- Module Name:    register_file - Behavioral 
-- Project Name: 
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
use IEEE.NUMERIC_STD.ALL;

entity register_file is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           read_register_address1 : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           read_register_address2 : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           write_register_address : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           write_data : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           regwrite : in  STD_LOGIC;
           register_data1 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           register_data2 : out  STD_LOGIC_VECTOR(15 DOWNTO 0));
end register_file;

architecture Behavioral of register_file is
type reg_file is array (0 TO 7) of STD_LOGIC_VECTOR(15 DOWNTO 0);
signal registers: reg_file;
begin
    process(clock, reset)
    begin
        if(reset='1') then
            registers <= (others => x"0000");
        end if;
        if (rising_edge(clock) and regwrite = '1') then
            registers(to_integer(unsigned(write_register_address))) <= write_data;
        end if;
    end process;
    register_data1 <= x"0000" when read_register_address1 = "000" else reg_array(to_integer(unsigned(reg1_address)));
    register_data2 <= x"0000" when read_register_address2 = "000" else reg_array(to_integer(unsigned(reg2_address)));
end Behavioral;


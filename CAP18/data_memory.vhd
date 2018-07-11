----------------------------------------------------------------------------------
-- Company: 	IUST
-- Engineer: 	Ali Jamali
-- 
-- Create Date:    06:04:56 07/11/2018 
-- Design Name: 	 Data Memory
-- Module Name:    data_memory - Behavioral 
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

entity data_memory is
    Port ( address1 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           address2 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           write_data : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           memwrite : in  STD_LOGIC;
           memory_data2 : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           memory_data1 : out  STD_LOGIC_VECTOR(15 DOWNTO 0));
end data_memory;

architecture Behavioral of data_memory is

type data_mem is array (0 To 1535) of STD_LOGIC_VECTOR(15 DOWNTO 0);
signal data: data_mem := (others => (others =>'0'));
signal data_memory_address1: STD_LOGIC_VECTOR(14 DOWNTO 0);
signal data_memory_address1: STD_LOGIC_VECTOR(14 DOWNTO 0);

begin
	data_memory_address1 <= address1(15 DOWNTO 1);
	data_memory_address2 <= address2(15 DOWNTO 1);
	process (memwrite, address1, address2)
	begin
		if (memwrite = '1') then
			data(to_integer(unsigned(data_memory_address1))) <= write_data;
		end if;
		memory_data1 <= data(to_integer(unsigned(data_memory_address1)));
		memory_data2 <= data(to_integer(unsigned(data_memory_address2)));
	end process;
end Behavioral;


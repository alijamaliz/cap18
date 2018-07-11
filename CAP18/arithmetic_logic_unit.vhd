----------------------------------------------------------------------------------
-- Company: 	IUST
-- Engineer: 	Ali Jamali
-- 
-- Create Date:    09:06:12 07/11/2018 
-- Design Name: 	 Arithmetic Logic Unit
-- Module Name:    arithmetic_logic_unit - Behavioral 
-- Project Name: 	 CAP18
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

entity arithmetic_logic_unit is
    Port ( input1 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           input2 : in  STD_LOGIC_VECTOR(15 DOWNTO 0);
           operation : in  STD_LOGIC_VECTOR(2 DOWNTO 0);
           result : out  STD_LOGIC_VECTOR(15 DOWNTO 0);
           status_register : out  STD_LOGIC_VECTOR(15 DOWNTO 0));
end arithmetic_logic_unit;

architecture Behavioral of arithmetic_logic_unit is

signal status_res: std_logic_vector(15 downto 0);

begin
process (input1, input2, operation)
begin
	status_result(14) <= '0';
	case alu_control is
		when "000" =>
			result <= '0' & num1 + num2; -- add
		when "110" =>
			mult_result <= '0' & num1 * num2;
		when "001" =>
			result <= '0' & num1 - num2; -- sub
		when "010" => 
			result <= '0' & num1 and num2; -- and
		when "011" =>
			result <= '0' & num1 or num2; -- or
		when "101" =>
			result <= '0' & std_logic_vector(shift_left(unsigned(num1), to_integer(unsigned(num2))));
		when "100" =>
			if (num1 < num2) then
				status_result(14) <= '1';
				result <= '0' & x"0000";
			else
				result <= '0' & x"0000";
			end if;
			if ( num1 = num2) then 
				zero <= '1';
				result <= '0' & x"0000";
			else
				result <= '0' & x"0000";
		end if;
	 	when others => result <= '0' & x"0000";
	end case;
end process;
status_result(15) <= '1' when result=x"0000" else '0'; -- Zero
status_result(13) <= '1' when (alu_control = "000" and num1(15) = num2(15) and num1(15) /=result(15)) or 
	(alu_control = "001" and num1(15) = num2(15) and num1(15) /= result(15)) else '0'; -- Overflow
status_result(12) <= result(16); -- Carry
alu_result <= mult_result(15 downto 0) when alu_control = "110" else result(15 downto 0);
status_result <= zero & negative & carry & overflow & "000000000000" ;

end Behavioral;


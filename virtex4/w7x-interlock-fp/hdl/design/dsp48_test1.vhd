----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:51:16 03/06/2015 
-- Design Name: 
-- Module Name:    dsp48_test1 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

use IEEE.STD_LOGIC_SIGNED.ALL; -- Signed arithmetic is used
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity dsp48_test1 is
Port ( CK : in std_logic;
		RST : in std_logic; -- Synchronous reset
		Ain, Bin : in std_logic_vector(17 downto 0); -- A and B inputs of the multiplier
		S : out std_logic_vector(47 downto 0) 
		); -- Accumulator output
end dsp48_test1;

architecture Behavioral of dsp48_test1 is
	signal ACC : std_logic_vector(47 downto 0); -- Accumulator output
	begin
	process(CK) begin
		if CK'event and CK = '1' then
			if RST = '1' then ACC <= (others => '0');
				else ACC <= ACC + (AIN * BIN);
			end if;
		end if;
	end process;
	S <= ACC;
end Behavioral;
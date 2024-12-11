library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MAC_SM is
port ( 
		i_RESET 	: in std_logic;
		i_CLK 	: in std_logic;
		i_START 	: in std_logic;
		i_END 	: in std_logic;
		o_DONE 	: out std_logic
		);
end MAC_SM;

architecture arch_MAC_SM of MAC_SM is

type STATE is (s_0, s_MUL, s_SOM, s_REG, s_FIM);
signal s_ATUAL : STATE;
signal s_PROXIMO : STATE;

begin

	p_ATUAL: process(i_CLK,i_RESET)
	begin
		if (i_RESET ='1') then
			s_ATUAL <= s_0; -- Estado incial
		elsif (rising_edge(i_CLK)) then
			s_ATUAL <= s_PROXIMO; -- Proximo estado
		end if;
	end process p_ATUAL;
		
	p_PROXIMO: process(i_START, i_END, s_ATUAL)
	begin
		case s_ATUAL is
			when s_0 =>
				if (i_START = '1') then
					s_PROXIMO <= s_MUL;
				else
					s_PROXIMO <= s_0;
				end if;
			when s_MUL =>
				s_PROXIMO <= s_SOM;
			when s_SOM =>
				s_PROXIMO <= s_REG;
			when s_REG =>
				s_PROXIMO <= s_FIM;
			when s_FIM =>
				if (i_END = '1') then
					s_PROXIMO <= s_0;
				else
					s_PROXIMO <= s_MUL;
				end if;					
			when others => s_PROXIMO <= s_0;
		end case;
	end process p_PROXIMO;
		
	o_DONE <= '1' when s_ATUAL = s_FIM else '0';
end arch_MAC_SM;
library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Multiplicador is
generic(
	   DATA_WIDTH_IN	: natural := 32;
       DATA_WIDTH_OUT	: natural := 64);
port(
		--i_CLOCK   : in std_logic;
		--i_RESET   : in std_logic;
        --i_ENABLE  : in std_logic;
        --i_CLEAR   : in std_logic;
		i_X	      : in std_logic_vector(DATA_WIDTH_IN-1 downto 0);
		i_H	      : in std_logic_vector(DATA_WIDTH_IN-1 downto 0);
        o_MLT	  : out std_logic_vector(DATA_WIDTH_OUT-1 downto 0)
		);
end Multiplicador;

architecture arch_Multi of Multiplicador is
	--signal w_MLT : std_logic_vector(DATA_WIDTH_OUT-1 downto 0);
    --signal w_IX	: unsigned(DATA_WIDTH_IN-1 downto 0);
    --signal w_IH	: unsigned(DATA_WIDTH_IN-1 downto 0);
begin
    --u_0: process(i_CLOCK)
	--begin
    	--w_IX <= unsigned(i_X);
        --w_IH <= unsigned(i_H);
    	--o_SM <= std_logic_vector(w_IX * w_IH);
        o_MLT <= std_logic_vector(unsigned(i_X)*unsigned(i_H));
        --o_SM <= w_SM(DATA_WIDTH_OUT-1 downto 0);
        
   	--end process;
end arch_Multi;

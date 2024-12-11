library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity multiplicador_tb is
generic
  	(
	   DATA_WIDTH_IN	: natural := 32;
       DATA_WIDTH_OUT	: natural := 64
  	);
port(
		i_CLOCK   : in std_logic;
		i_RESET   : in std_logic;
        i_ENABLE  : in std_logic;
        i_CLEAR   : in std_logic--;
        --o_SAIDA	  : out std_logic_vector(DATA_WIDTH_OUT-1 downto 0)
		);
end;

architecture arch_Multi_tb of multiplicador_tb is

	component Multiplicador is
port (
		--i_CLOCK   : in std_logic;
		--i_RESET   : in std_logic;
        --i_ENABLE  : in std_logic;
        --i_CLEAR   : in std_logic;
		i_X	      : in std_logic_vector(DATA_WIDTH_IN-1 downto 0);
		i_H	      : in std_logic_vector(DATA_WIDTH_IN-1 downto 0);
        o_MLT	  : out std_logic_vector(DATA_WIDTH_OUT-1 downto 0)
		);
end component;

	signal w_X : std_logic_vector(DATA_WIDTH_IN-1 downto 0);
	signal w_H : std_logic_vector(DATA_WIDTH_IN-1 downto 0);
    signal w_OUT : std_logic_vector(DATA_WIDTH_OUT-1 downto 0);

begin

	u_Multi: Multiplicador 
    port map(
		--i_CLOCK  => i_CLOCK,
		--i_RESET  => i_RESET,
		--i_ENABLE => i_ENABLE,
		--i_CLEAR  => i_CLEAR,
        i_X		=>	w_X,
        i_H		=>	w_H,
		o_MLT  => w_OUT);

	u_0: process
    begin
    	--i_X_tb	<=	'00000000 00000000 00000000 00001010';
        --i_H_tb	<=	'00000000 00000000 00000000 00001010';
        
       -- w_X 	<=	i_X_tb;
        --w_H 	<=	i_H_tb;
        
        w_X 	<=	"00000000000000000000000000001010";
        w_H 	<=	"00000000000000000000000000001010";
        wait for 5ns;
        
        w_X 	<=	"00000000000000000000000000000010";
        w_H 	<=	"00000000000000000000000000000010";
        wait for 5ns;
        
        w_X 	<=	"00000000000000000000000000000100";
        w_H 	<=	"00000000000000000000000000000100";
        wait;
        
   	end process;
end arch_Multi_tb;
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity somador_tb is
generic
  	(
	   DATA_WIDTH	: natural := 64
  	);
end;

architecture arch_somador_tb of somador_tb is

	component Somador is
port (
		i_M	      : in std_logic_vector(DATA_WIDTH-1 downto 0);
		i_R	      : in std_logic_vector(DATA_WIDTH-1 downto 0);
        o_SM	  : out std_logic_vector(DATA_WIDTH-1 downto 0)
		);
end component;

	signal w_M : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal w_R : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal w_OUT : std_logic_vector(DATA_WIDTH-1 downto 0);

begin

	u_Som: Somador 
    port map(
        i_M		=>	w_M,
        i_R		=>	w_R,
		o_SM  => w_OUT);

	u_0: process
    begin
        
        w_M 	<=	"0000000000000000000000000000000000000000000000000000000000000100";
        w_R 	<=		"0000000000000000000000000000000000000000000000000000000000000100";
        wait for 100ns;
        
        w_M 	<=		"0000000000000000000000000000000000000000000000000000000000000010";
        w_R 	<=		"0000000000000000000000000000000000000000000000000000000000000010";
        wait for 100ns;
        
        w_M 	<=		"0000000000000000000000000000000000000000000000000000000000000000";
        w_R 	<=		"0000000000000000000000000000000000000000000000000000000000000000";
        wait;
        
   	end process;
end arch_somador_tb;
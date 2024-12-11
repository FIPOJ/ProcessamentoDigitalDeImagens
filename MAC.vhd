library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity MAC is
generic(
	   DATA_WIDTH_IN : natural := 32;
		DATA_WIDTH_OUT : natural := 64);
port(
		i_RESET    	: in std_logic;
		i_CLK    	: in std_logic;
		i_ENA  		: in std_logic;
		i_START   	: in std_logic;
		i_END   		: in std_logic;
		i_X	   	: in std_logic_vector(DATA_WIDTH_IN-1 downto 0);
      i_H	   	: in std_logic_vector(DATA_WIDTH_IN-1 downto 0);
		o_DONE		: out std_logic;
      o_OUT    	: out std_logic_vector(DATA_WIDTH_OUT-1 downto 0)
		);
end MAC;

architecture arch_MAC of MAC is

component Datapath is
port ( i_RESET : in  std_logic;
       i_CLK   : in  std_logic;
       i_ENA   : in  std_logic := '1'; 
       i_X	   : in std_logic_vector(DATA_WIDTH_IN-1 downto 0);
       i_H	   : in std_logic_vector(DATA_WIDTH_IN-1 downto 0);
       o_OUT     : out std_logic_vector(DATA_WIDTH_OUT-1 downto 0)); -- data output
end component;

component MAC_SM is
port ( 
		i_RESET 	: in std_logic;
		i_CLK 	: in std_logic;
		i_START 	: in std_logic;
		i_END 	: in std_logic;
		o_DONE 	: out std_logic
		);
end component;
	
begin

	u_Datapath: Datapath port map(
		 i_RESET => i_RESET,
		 i_CLK	=> i_CLK,
		 i_ENA    => i_ENA,
		 i_X    => i_X,
		 i_H    => i_H,
		 o_OUT    => o_OUT);

	u_SM: MAC_SM port map(
		 i_RESET => i_RESET,
		 i_CLK	=> i_CLK,
		 i_START    => i_START,
		 i_END    => i_END,
		 o_DONE    => o_DONE);

end arch_MAC;
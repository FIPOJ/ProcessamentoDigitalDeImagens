library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Datapath is
generic(
	   DATA_WIDTH_IN : natural := 32;
       DATA_WIDTH_OUT : natural := 64);
port ( i_RESET : in  std_logic;  -- clear/reset
       i_CLK   : in  std_logic;  -- clock
       i_ENA   : in  std_logic := '1';  -- enable   
       i_X	   : in std_logic_vector(DATA_WIDTH_IN-1 downto 0);
       i_H	   : in std_logic_vector(DATA_WIDTH_IN-1 downto 0);
       o_OUT     : out std_logic_vector(DATA_WIDTH_OUT-1 downto 0)); -- data output
end Datapath;


architecture arch_Bloco of Datapath is

	component Multiplicador is
port (
		i_X	      : in std_logic_vector(DATA_WIDTH_IN-1 downto 0);
		i_H	      : in std_logic_vector(DATA_WIDTH_IN-1 downto 0);
        o_MLT	  : out std_logic_vector(DATA_WIDTH_OUT-1 downto 0)
		);
end component;
    
    component Somador is
port (
		i_M	      : in std_logic_vector(DATA_WIDTH_OUT-1 downto 0);
		i_R	      : in std_logic_vector(DATA_WIDTH_OUT-1 downto 0);
        o_SM	  : out std_logic_vector(DATA_WIDTH_OUT-1 downto 0));
end component;

	component Registrador is
port(
	i_RESET : in  std_logic;  -- clear/reset
    i_CLK   : in  std_logic;  -- clock
    i_ENA   : in  std_logic;  -- enable    
    i_D     : in  std_logic_vector(DATA_WIDTH_OUT-1 downto 0);  -- data input
    o_Q     : out std_logic_vector(DATA_WIDTH_OUT-1 downto 0)); -- data output
end component;
    
	signal w_X		 : std_logic_vector(DATA_WIDTH_IN-1 downto 0);
    signal w_H		 : std_logic_vector(DATA_WIDTH_IN-1 downto 0);
    signal w_MULT	 : std_logic_vector(DATA_WIDTH_OUT-1 downto 0);
    signal w_SOM	 : std_logic_vector(DATA_WIDTH_OUT-1 downto 0);
    signal w_REG	 : std_logic_vector(DATA_WIDTH_OUT-1 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";

begin
  u_Multi: Multiplicador 
    port map(
        i_X		=>	w_X,
        i_H		=>	w_H,
		o_MLT  => w_MULT);
        
  u_Som: Somador 
    port map(
        i_M		=>	w_MULT,
        i_R		=>	w_REG,
		o_SM  => w_SOM);
        
  u_Reg: Registrador 
    port map(
    	i_RESET		=>	i_RESET,
    	i_CLK		=>	i_CLK,
    	i_ENA		=>	i_ENA,
    	i_D			=>	w_SOM,
    	o_Q			=>	w_REG);
  
  w_H	<=	i_H;
  w_X	<=	i_X;
  o_OUT	<= w_REG;
  
end arch_Bloco;
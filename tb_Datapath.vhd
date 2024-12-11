library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.all;

entity datapath_tb is
generic
  	(
	   DATA_WIDTH_32 : natural := 32;
       DATA_WIDTH_64 : natural := 64
  	);
end;

architecture arch_Bloco_tb of datapath_tb is

	component Bloco is
port(
	i_RESET : in  std_logic;  -- clear/reset
    i_CLK   : in  std_logic;  -- clock
    i_ENA   : in  std_logic := '1';  -- enable   
    i_X	   : in std_logic_vector(DATA_WIDTH_32-1 downto 0);
    i_H	   : in std_logic_vector(DATA_WIDTH_32-1 downto 0);
    o_OUT     : out std_logic_vector(DATA_WIDTH_64-1 downto 0));
end component;
	
    signal w_Xi, w_Hi: std_logic_vector(DATA_WIDTH_32-1 downto 0);
    signal w_OUT: std_logic_vector(DATA_WIDTH_64-1 downto 0);
    signal w_CLK, w_RESET: std_logic;
    signal w_ENA: std_logic:= '1';
    constant c_CLK_PERIOD : time := 5 ns;
    
begin
	
    u_Bloco: Bloco 
    port map(
    	i_RESET		=>	w_RESET,
    	i_CLK		=>	w_CLK,
    	i_ENA		=>	w_ENA,
        i_X			=>	w_Xi,
        i_H			=>	w_Hi,
        o_OUT		=>	w_OUT);

	u_CLK: process
	begin
		w_CLK <= '0';
 		wait for c_CLK_PERIOD;
		w_CLK <= '1';
 		wait for c_CLK_PERIOD;
        
 	end process u_CLK;
    
    u_0: process
	begin
    	
		w_RESET <= '1'; 
        w_Xi <= "00000000000000000000000000000001";
        w_Hi <= "00000000000000000000000000000001";
		--wait for 5ns;
        wait until w_CLK = '1' and w_CLK'event;
        
		w_RESET <= '0'; 
        w_Xi <= "00000000000000000000000000000001";
        w_Hi <= "00000000000000000000000000000001";
        --wait for 5ns;
		wait until w_CLK = '1' and w_CLK'event;
        
        w_Xi <= "00000000000000000000000000000010";
        w_Hi <= "00000000000000000000000000000010";
        --wait for 5ns;
		wait until w_CLK = '1' and w_CLK'event;
        
        w_Xi <= "00000000000000000000000000000100";
        w_Hi <= "00000000000000000000000000000100";
        --wait for 5ns;
		wait until w_CLK = '1' and w_CLK'event;
        
        w_RESET <= '1';
        w_Xi <= "00000000000000000000000000000100";
        w_Hi <= "00000000000000000000000000000100";
        --wait for 5ns;
		wait until w_CLK = '1' and w_CLK'event;
		
        
		w_ENA <= '0';												-- set loop termination variable
		wait;															-- always   
   	end process;
    
   
end arch_Bloco_tb;
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.all;

entity mac_tb is
generic
  	(
	   DATA_WIDTH_IN : natural := 32;
       DATA_WIDTH_OUT : natural := 64
  	);
end;

architecture arch_Mac_tb of mac_tb is

	component MAC is
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
end component;
	
    signal w_X, w_H: std_logic_vector(DATA_WIDTH_IN-1 downto 0);
    signal w_OUT: std_logic_vector(DATA_WIDTH_OUT-1 downto 0);
    signal w_RESET, w_CLK, w_START, w_END, w_DONE: std_logic;
    signal w_ENA: std_logic:= '1';
    constant c_CLK_PERIOD : time := 5 ns;
    
begin
	
    u_Mac: MAC 
    port map(
    	i_RESET		=>	w_RESET,
    	i_CLK		=>	w_CLK,
    	i_ENA		=>	w_ENA,
        i_START		=>	w_START,
        i_END		=>	w_END,
        i_X			=>	w_X,
        i_H			=>	w_H,
        o_DONE		=>	w_DONE,
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
    	
        w_START <= '0';
        w_END	<= '0';
        
		w_RESET <= '1'; 
        w_X <= "00000000000000000000000000000001";
        w_H <= "00000000000000000000000000000001";
		--wait for 5ns;
        wait until w_CLK = '1' and w_CLK'event;
        
		w_RESET <= '0'; 
        w_START <= '1';
        w_X <= "00000000000000000000000000000001";
        w_H <= "00000000000000000000000000000001";
        --wait for 5ns;
		wait until w_CLK = '1' and w_CLK'event;
        
        w_X <= "00000000000000000000000000000010";
        w_H <= "00000000000000000000000000000010";
        --wait for 5ns;
		wait until w_CLK = '1' and w_CLK'event;
        
        w_END <= '1';
        w_X <= "00000000000000000000000000000100";
        w_H <= "00000000000000000000000000000100";
        --wait for 5ns;
		wait until w_CLK = '1' and w_CLK'event;
        
        w_RESET <= '1';
        w_X <= "00000000000000000000000000000100";
        w_H <= "00000000000000000000000000000100";
        --wait for 5ns;
		wait until w_CLK = '1' and w_CLK'event;
		
        
		w_ENA <= '0';												-- set loop termination variable
		wait;															-- always   
   	end process;
    
   
end arch_Mac_tb;
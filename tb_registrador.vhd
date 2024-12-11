library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity registrador_tb is
generic
  	(
	   DATA_WIDTH	: natural := 64
  	);
end;

architecture arch_Reg_tb of registrador_tb is

	component Registrador is
port(
	i_RESET : in  std_logic;  -- clear/reset
    i_CLK   : in  std_logic;  -- clock
    i_ENA   : in  std_logic;  -- enable    
    i_D     : in  std_logic_vector(DATA_WIDTH-1 downto 0);  -- data input
    o_Q     : out std_logic_vector(DATA_WIDTH-1 downto 0)); -- data output
    
end component;

	signal w_D, w_Q: std_logic_vector(DATA_WIDTH-1 downto 0);
    signal w_CLK, w_RESET: std_logic;
    signal w_ENA: std_logic:= '1';
    
begin
	
    u_Reg: Registrador 
    port map(
    	i_RESET		=>	w_RESET,
    	i_CLK		=>	w_CLK,
    	i_ENA		=>	w_ENA,
    	i_D			=>	w_D,
    	o_Q			=>	w_Q);

	u_CLK: process											-- stimulus generator
	begin
	
    	--while w_ENA loop										-- loop até a finalização do programa
		w_CLK <= '0'; wait for 5 ns;
		w_CLK <= '1'; wait for 5 ns;
        w_CLK <= '0'; wait for 5 ns;
		w_CLK <= '1'; wait for 5 ns;
        w_CLK <= '0'; wait for 5 ns;
		w_CLK <= '1'; wait for 5 ns;
        w_CLK <= '0'; wait for 5 ns;
		w_CLK <= '1'; wait for 5 ns;
        w_CLK <= '0'; wait for 5 ns;
		w_CLK <= '1'; wait for 5 ns;
    	--end loop;
    	wait;
 	end process u_CLK;
    
     u_0: process
	begin
		w_RESET <= '1'; 
        w_D <= "0000000000000000000000000000000000000000000000000000000000000000";
		wait until w_CLK = '1' and w_CLK'event;
        
		w_RESET <= '0'; 
        w_D <= "0000000000000000000000000000000000000000000000000000000000000001";
		wait until w_CLK = '1' and w_CLK'event;
	
		w_D <= "0000000000000000000000000000000000000000000000000000000000000100";
		wait until w_CLK = '1' and w_CLK'event;
	
		w_D <= "0000000000000000000000000000000000000000000000000000000000000010"; 
		wait until w_CLK = '1' and w_CLK'event;
   		wait for 5 ns;
		w_ENA <= '0';												-- set loop termination variable
		wait;															-- always   
   	end process;
    
   
end arch_Reg_tb;
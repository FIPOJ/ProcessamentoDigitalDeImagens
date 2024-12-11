library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Somador is
generic(
	   DATA_WIDTH	: natural := 64);
port ( 
       i_M : in  std_logic_vector(DATA_WIDTH-1 downto 0);  -- Entrada Multiplicador
       i_R : in  std_logic_vector(DATA_WIDTH-1 downto 0);  -- Entrada Registrador
       
       o_SM : out std_logic_vector(DATA_WIDTH-1 downto 0)); -- Saida
end Somador;

architecture arch_somador of Somador is
	signal w_SM : std_logic_vector(DATA_WIDTH downto 0);
    --signal w_IX	: unsigned(DATA_WIDTH_IN-1 downto 0);
    --signal w_IH	: unsigned(DATA_WIDTH_IN-1 downto 0);
begin
    --u_0: process(i_CLOCK)
	--begin
    	--w_IX <= unsigned(i_X);
        --w_IH <= unsigned(i_H);
    	--o_SM <= std_logic_vector(w_IX * w_IH);
        --w_SM <= i_M + i_R;
        --w_SM <= std_logic_vector(unsigned(i_M)+unsigned(i_R));
        w_SM <= std_logic_vector(('0' & unsigned(i_M)) + ('0' & unsigned(i_R))); 
        --std_logic_vector(unsigned(i_M)+unsigned(i_R));
        o_SM <= w_SM(DATA_WIDTH-1 downto 0);
        --o_SM <= w_SM(DATA_WIDTH_OUT-1 downto 0);
        
   	--end process;
end arch_somador;

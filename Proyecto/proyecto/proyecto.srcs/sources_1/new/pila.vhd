library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pila is
    generic (
        pc_size : integer := 16;
        n : integer := 3
    );
    Port ( PC_in : in STD_LOGIC_VECTOR (pc_size-1 downto 0);
           clk, clr, WPC, UP, DW : in STD_LOGIC;
           PC_out : out STD_LOGIC_VECTOR (pc_size-1 downto 0);
           SP : out STD_LOGIC_VECTOR (n-1 downto 0)
    );
end entity;

architecture Behavioral of pila is
type arreglo is array (0 to (2**n - 1)) of STD_LOGIC_VECTOR (pc_size-1 downto 0);
signal pointers : arreglo := (others=>(others=>'0'));
signal aux_sp : STD_LOGIC_VECTOR (n-1 downto 0);
begin
    process (clk, clr, UP, DW, WPC)
    variable v_sp : integer := 0;
    begin
        if (clr = '1') then
            v_sp := 0;
            pointers <= (others=>(others=>'0'));
        elsif (rising_edge(clk)) then
            if (UP = '1') then
                v_sp := v_sp + 1;
            elsif (DW = '1') then
                v_sp := v_sp - 1;
            else
                v_sp := v_sp;
            end if;
            
            if (WPC = '1') then
                pointers(v_sp) <= PC_in;
            else
                pointers(v_sp) <= pointers(v_sp) + 1;
            end if;
            
            aux_sp <= conv_std_logic_vector(v_sp, n);
        end if;
    end process;
    
    PC_out <= pointers(conv_integer(aux_sp));
    SP <= aux_sp;
end Behavioral;
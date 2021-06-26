library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_nivel is
--  Port ( );
end tb_nivel;

architecture Behavioral of tb_nivel is
    component nivel is
        Port (
            CLK, CLR : in STD_LOGIC;
            NA : out STD_LOGIC
        );
    end component;
    
    signal clr, clk, na : STD_LOGIC;
    
begin
    niv : nivel Port map (
        clk => clk,
        clr => clr,
        na => na
    );
    
    reloj : process begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;
    
    process
    begin
        clr <= '1';
        wait for 3 ns;
        clr <= '0';
        wait;
    end process;
end Behavioral;

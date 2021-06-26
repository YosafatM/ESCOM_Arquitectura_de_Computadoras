library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nivel is
    Port (
        CLK, CLR : in STD_LOGIC;
        NA : out STD_LOGIC
    );
end nivel;

architecture Behavioral of nivel is
signal up_clk, down_clk : STD_LOGIC := '0';
begin
    alto: process (CLK, CLR)
    begin
        if (CLR = '1') then
            up_clk <= '0';
        elsif (rising_edge(CLK)) then
            up_clk <= not up_clk;
        end if;
    end process;
    
    bajo: process (CLK, CLR, up_clk)
    begin
        if (CLR = '1') then
            down_clk <= '0';
        elsif (falling_edge(CLK)) then
            down_clk <= not down_clk;
        end if;
    end process;
    
    NA <= up_clk xor down_clk;
end Behavioral;

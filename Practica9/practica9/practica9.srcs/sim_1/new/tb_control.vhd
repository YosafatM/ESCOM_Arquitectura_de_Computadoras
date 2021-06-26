library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_control is
end tb_control;

architecture Behavioral of tb_control is
constant clk_period : time := 10 ns;
component control is
    Port ( 
        CLK, CLR, Z, A0, INI : in STD_LOGIC;
        LA, LB, EA, EB, EC : out STD_LOGIC
    );
end component;
signal CLK, CLR, Z, A0, INI, LA, LB, EA, EB, EC : STD_LOGIC;
begin
    tb : control port map (
        CLK => CLK,
        CLR => CLR,
        Z => Z,
        A0 => A0,
        INI => INI,
        LA => LA,
        LB => LB,
        EA => EA,
        EB => EB,
        EC => EC
    );
    
    clk_process : process
    begin
        CLK <= '0';
        wait for clk_period/2;
        CLK <= '1';
        wait for clk_period/2;
    end process;
    
    process
    begin
        CLR <= '1';
        Z <= '0';
        A0 <= '0';
        INI <= '0';
        wait for 30 ns;
        clr <= '0';
        wait for 60 ns;
        INI <= '1';
        wait for 10 ns;
        INI <= '0';
        wait for 50 ns;
        A0 <= '1';
        wait for 10 ns;
        A0 <= '0';
        wait for 20 ns;
        A0 <= '1';
        wait for 10 ns;
        A0 <= '0';
        wait for 120 ns;
        Z <= '1';
        wait;
    end process;
end Behavioral;

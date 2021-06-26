library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_ESCOMIPS is
--  Port ( );
end tb_ESCOMIPS;

architecture Behavioral of tb_ESCOMIPS is
constant clk_period : time := 10 ns;

component ESCOMIPS is
    Port (
        CLR, CLK : in STD_LOGIC;
        t_alu, t_RR1, t_RR2, t_PC, t_bus_SR : out STD_LOGIC_VECTOR (15 downto 0);
        t_inst : out STD_LOGIC_VECTOR (24 downto 0);
        t_micro : out STD_LOGIC_VECTOR (19 downto 0)
    );
end component;

signal CLR, CLK : STD_LOGIC;
signal t_alu, t_RR1, t_RR2, t_PC, t_bus_SR : STD_LOGIC_VECTOR (15 downto 0);
signal t_inst : STD_LOGIC_VECTOR (24 downto 0);
signal t_micro : STD_LOGIC_VECTOR (19 downto 0);
begin
    test : ESCOMIPS port map (
        CLR => CLR,
        CLK => CLK,
        t_alu => t_alu,
        t_RR1 => t_RR1,
        t_RR2 => t_RR2,
        t_PC => t_PC,
        t_bus_SR => t_bus_SR,
        t_inst => t_inst,
        t_micro => t_micro
    );

    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    process
    begin
        CLR <= '1';
        wait until rising_edge(CLK);
        CLR <= '0';
        wait for 1000 ns;
        wait;
    end process;
end Behavioral;

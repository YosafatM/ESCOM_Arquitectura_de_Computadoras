library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_decodificador is
end tb_decodificador;

architecture Behavioral of tb_decodificador is
constant clk_period : time := 10 ns;
component decodificador is
    Port (
        QB : in STD_LOGIC_VECTOR (3 downto 0);
        NUM : out STD_LOGIC_VECTOR (6 downto 0)
    );
end component;
signal QB : STD_LOGIC_VECTOR (3 downto 0);
signal NUM : STD_LOGIC_VECTOR (6 downto 0);
begin
    tb : decodificador Port map (
        QB => QB,
        NUM => NUM
    );
    
    process
    begin
        QB <= "0000";
        wait for 30 ns;
        QB <= "0001";
        wait for 30 ns;
        QB <= "0010";
        wait for 30 ns;
        QB <= "0011";
        wait for 30 ns;
        QB <= "0100";
        wait for 30 ns;
        QB <= "0101";
        wait for 30 ns;
        QB <= "0110";
        wait for 30 ns;
        QB <= "0111";
        wait for 30 ns;
        QB <= "1000";
        wait for 30 ns;
        QB <= "1001";
        wait for 30 ns;
        QB <= "1010";
        wait for 30 ns;
        QB <= "1011";
        wait for 30 ns;
        QB <= "1100";
        wait for 30 ns;
        QB <= "1101";
        wait for 30 ns;
        QB <= "1110";
        wait for 30 ns;
        QB <= "1111";
        wait;
    end process;
end Behavioral;

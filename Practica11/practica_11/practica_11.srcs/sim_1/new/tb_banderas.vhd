library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_banderas is
--  Port ( );
end tb_banderas;

architecture Behavioral of tb_banderas is
    component banderas is
        Port (
            LF, CLK, CLR : in STD_LOGIC;
            D : in STD_LOGIC_VECTOR (3 downto 0);
            Q : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    signal clr, clk, LF : STD_LOGIC;
    signal D, Q : STD_LOGIC_VECTOR (3 downto 0);
begin
    reg : banderas port map(
        D => D,
        clr => clr,
        clk => clk,
        LF => LF,
        Q => Q
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
        wait until falling_edge(clk);
        clr <= '0';
        LF <= '1';
        D <= "1111";
        wait until falling_edge(clk);
        D <= "0000";
        wait until falling_edge(clk);
        D <= "0001";
        wait until falling_edge(clk);
        D <= "0010";
        wait until falling_edge(clk);
        D <= "0011";
        wait until falling_edge(clk);       
        LF <= '0';
        D <= "0000";
        wait until falling_edge(clk);
        D <= "0001";
        wait;
    end process;
end Behavioral;

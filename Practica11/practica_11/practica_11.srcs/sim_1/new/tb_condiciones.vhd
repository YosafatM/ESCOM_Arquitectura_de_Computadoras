library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_condiciones is
--  Port ( );
end tb_condiciones;

architecture Behavioral of tb_condiciones is
    component condiciones is
        Port (
            Q : in STD_LOGIC_VECTOR (3 downto 0);
            EQ, NE, LT, LE, GT, GE : out STD_LOGIC
        );
    end component;

    signal EQ, NE, LT, LE, GT, GE : STD_LOGIC;
    signal Q : STD_LOGIC_VECTOR (3 downto 0);
    
begin
    con : condiciones Port map (
        Q => Q,
        EQ => EQ,
        NE => NE,
        LT => LT,
        LE => LE,
        GT => GT,
        GE => GE 
    );
    
    --Q[OV, N, Z, C]
    process
    begin
        Q <= "0010";
        wait for 10 ns;
        Q <= "1101";
        wait for 10 ns;
        Q <= "0001";
        wait for 10 ns;
        Q <= "0000";
        wait for 10 ns;
        Q <= "1111";
        wait;
    end process;
end Behavioral;

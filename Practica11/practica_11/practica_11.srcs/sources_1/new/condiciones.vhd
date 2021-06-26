library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity condiciones is
    Port (
        Q : in STD_LOGIC_VECTOR (3 downto 0);
        EQ, NE, LT, LE, GT, GE : out STD_LOGIC
    );
end condiciones;

architecture Behavioral of condiciones is
begin
    -- Q = "OV N Z C"
    EQ <= Q(1);
    NE <= not Q(1);
    LT <= not Q(0);
    LE <= Q(1) or not Q(0);
    GT <= not Q(1) and Q(0);
    GE <= Q(0);
end Behavioral;

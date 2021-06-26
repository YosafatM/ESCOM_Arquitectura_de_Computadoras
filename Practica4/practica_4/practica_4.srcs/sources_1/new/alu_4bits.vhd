library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_4bits is
    Port ( A, B, op : in STD_LOGIC_VECTOR (3 downto 0);
           OV, Z, C, N : out STD_LOGIC;
           R : inout STD_LOGIC_VECTOR (3 downto 0)
);
end alu_4bits;

architecture Behavioral of alu_4bits is
component alu_1bit is
    Port ( a, b, s_a, s_b, cin : in STD_LOGIC;
           alu_op : in STD_LOGIC_VECTOR (1 downto 0);
           r, cout : out STD_LOGIC);
end component;

signal SEL : STD_LOGIC_VECTOR (3 downto 0);
signal carry : STD_LOGIC_VECTOR (4 downto 0);
begin
    carry(0) <= op(2);

    ciclo: for j in 0 to 3 generate
        comp : alu_1bit port map(
            a => A(j),
            b => B(j),
            s_a => op(3),
            s_b => op(2),
            cin =>  carry(j),
            alu_op => op (1 downto 0),
            r => R(j),
            cout => carry(j+1)
        );
    end generate;
    
    with op select
        OV <= carry(3) xor carry(4) when "0011",
            carry(3) xor carry(4) when "0111",
            '0' when others;
    
    with op select
        C <= carry(4) when "0011",
            carry(4) when "0111",
            '0' when others;
    
    N <= R(3);
    Z <= not (R(0) or R(1) or R(2) or R(3));
end Behavioral;

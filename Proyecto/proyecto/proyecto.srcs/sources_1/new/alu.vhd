library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_misc.all;

entity alu is
    generic (
        m : integer := 16
    );
    Port ( A, B : in STD_LOGIC_VECTOR (m-1 downto 0);
           op : in STD_LOGIC_VECTOR (3 downto 0);
           OV, Z, C, N : out STD_LOGIC;
           R : inout STD_LOGIC_VECTOR (m-1 downto 0)
    );
end entity;

architecture Behavioral of alu is
component alu_1bit is
    Port ( a, b, s_a, s_b, cin : in STD_LOGIC;
           alu_op : in STD_LOGIC_VECTOR (1 downto 0);
           r, cout : out STD_LOGIC);
end component;

signal carry : STD_LOGIC_VECTOR (m downto 0);
begin
    carry(0) <= op(2);

    ciclo: for j in 0 to m-1 generate
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
        OV <= carry(m-1) xor carry(m) when "0011",
            carry(m-1) xor carry(m) when "0111",
            '0' when others;
    
    with op select
        C <= carry(m) when "0011",
            carry(m) when "0111",
            '0' when others;
    
    N <= R(m-1);
    Z <= not or_reduce(R);
end Behavioral;

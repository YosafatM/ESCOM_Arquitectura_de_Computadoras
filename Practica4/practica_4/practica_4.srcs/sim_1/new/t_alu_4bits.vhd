library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_alu_4bits is
--  Port ( );
end t_alu_4bits;

architecture Behavioral of t_alu_4bits is
component alu_4bits is
    Port ( A, B, op : in STD_LOGIC_VECTOR (3 downto 0);
           OV, Z, C, N : out STD_LOGIC;
           R : inout STD_LOGIC_VECTOR (3 downto 0)
);
end component;

signal A, B, op : STD_LOGIC_VECTOR (3 downto 0);
signal OV, Z, C, N : STD_LOGIC;
signal R : STD_LOGIC_VECTOR (3 downto 0);
begin

    test : alu_4bits port map (
        A => A,
        B => B,
        op => op,
        OV => OV,
        Z => Z,
        C => C,
        N => N,
        R => R
    );
    
    process
    begin
    A <= "0101"; -- 5
    B <= "1110"; -- -2
    
    op <= "0011"; -- +
    wait for 50 ns;
    
    op <= "0111"; -- -
    wait for 50 ns;
    
    op <= "0000"; -- and
    wait for 50 ns;
    
    op <= "1101"; -- nand
    wait for 50 ns;
    
    op <= "0001"; -- or
    wait for 50 ns;
    
    op <= "1100"; -- nor
    wait for 50 ns;
    
    op <= "0010"; -- xor
    wait for 50 ns;
    
    op <= "1010"; --xnor
    wait for 50 ns;
    
    B <= "0111";
    op <= "0011"; -- +
    wait for 50 ns;
    
    B <= "0101";
    op <= "0111"; -- -
    wait for 50 ns;
    
    op <= "1101"; -- nand
    wait;
    end process;

end Behavioral;

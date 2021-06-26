library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_sum_res_4bits is
--  Port ( );
end t_sum_res_4bits;

architecture Behavioral of t_sum_res_4bits is
component sum_res_4bits is
    Port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0)
);
end component;
signal A, B, S : STD_LOGIC_VECTOR (3 downto 0);
signal Cin : STD_LOGIC;
signal Cout : STD_LOGIC;
begin
    element : sum_res_4bits port map (
        A => A,
        B => B,
        Cin => Cin,
        Cout => Cout,
        S => S
    );

    process
    begin
        --Caso 1: 6 + 7
        A <= "0110";
        B <= "0111";
        Cin <= '0';
        wait for 50 ns;

        --Caso 2: 6 + 9
        B <= "1001";
        wait for 50 ns;

        --Caso 3: 4 + 9
        A <= "0100";
        wait for 50 ns;

        --Caso 4: 15 - 1
        A <= "1111";
        B <= "0001";
        Cin <= '1';
        wait for 50 ns;

        --Caso 5: 3 + 10
        A <= "0011";
        B <= "1010";
        Cin <= '0';
        wait for 50 ns;

        --Caso 6: 12 - 5
        A <= "1100";
        B <= "0101";
        Cin <= '1';
        wait for 50 ns;

        --Caso 7: 14 - 8
        A <= "1110";
        B <= "1000";
        wait for 50 ns;

        --Caso 8: 10 - 6
        A <= "1010";
        B <= "0110";
        wait for 50 ns;

        --Caso 9: 9 - 4
        A <= "1001";
        B <= "0100";
        wait;
    end process;
end Behavioral;

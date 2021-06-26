library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum_res_4bits is
    Port ( A, B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0)
);
end sum_res_4bits;

architecture Behavioral of sum_res_4bits is
component sum_1bit is
    Port ( a, b, cin : in STD_LOGIC;
           s,cout : out STD_LOGIC);
end component;

signal SEL : STD_LOGIC_VECTOR (3 downto 0);
signal C : STD_LOGIC_VECTOR (4 downto 0);
begin
    C(0) <= Cin;

    ciclo: for j in 0 to 3 generate
        SEL(j) <= B(j) xor C(0);
        comp : sum_1bit port map(
            a => A(j),
            b => SEL(j),
            cin =>  C(j),
            s => S(j),
            cout => C(j+1)
        );
    end generate;
    
    Cout <= C(4);

end Behavioral;

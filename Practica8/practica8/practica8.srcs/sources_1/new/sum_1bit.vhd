library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
entity sum_1bit is
    Port ( a, b, cin : in STD_LOGIC;
           s, cout : out STD_LOGIC);
end sum_1bit;

architecture Behavioral of sum_1bit is
begin
s <= a xor b xor cin;
cout <= (a and b) or (a and cin) or (b and cin);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_1bit is
    Port ( a, b, s_a, s_b, cin : in STD_LOGIC;
           alu_op : in STD_LOGIC_VECTOR (1 downto 0);
           r, cout : out STD_LOGIC);
end alu_1bit;

architecture Behavioral of alu_1bit is
component sum_1bit is
    Port ( a, b, cin : in STD_LOGIC;
           s,cout : out STD_LOGIC);
end component;

signal aux_b, aux_a, aux_and, aux_or, aux_xor, aux_sum : STD_LOGIC;
begin
    aux_a <= (a and not s_a) or (s_a and not a);
    aux_b <= (b and not s_b) or (s_b and not b);
    
    aux_and <= aux_a and aux_b;
    aux_or <= aux_a or aux_b;
    aux_xor <= aux_a xor aux_b;
    sum : sum_1bit port map (
        a => aux_a,
        b => aux_b,
        cin => cin,
        s => aux_sum,
        cout => cout
    );

    process (aux_and, aux_or, aux_xor, aux_sum, alu_op)
    begin        
        case alu_op is
            when "00" => r <= aux_and;
            when "01" => r <= aux_or;
            when "10" => r <= aux_xor;           
            when others => r <= aux_sum;
        end case;
    end process;

end Behavioral;

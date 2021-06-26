library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_fun_code is
--  Port ( );
end tb_fun_code;

architecture Behavioral of tb_fun_code is
    component memoria_fun_code is
        generic (
            m : integer := 4;
            n : integer := 20
        );
        Port ( index : in STD_LOGIC_VECTOR (m-1 downto 0);
               code : out STD_LOGIC_VECTOR (n-1 downto 0)
        );
    end component;
    
    signal funCode : STD_LOGIC_VECTOR (3 downto 0);
    signal microFuncion : STD_LOGIC_VECTOR (19 downto 0);
    
begin
    fun : memoria_fun_code Port map (
        index => funCode,
        code => microFuncion
    );
    
    process
    begin
        funCode <= "0000";
        wait for 10 ns;
        funCode <= "0001";
        wait for 10 ns;
        funCode <= "0010";
        wait for 10 ns;
        funCode <= "0011";
        wait for 10 ns;
        funCode <= "0100";
        wait for 10 ns;
        funCode <= "0101";
        wait for 10 ns;
        funCode <= "0110";
        wait for 10 ns;
        funCode <= "0111";
        wait for 10 ns;
        funCode <= "1000";
        wait;
    end process;
end Behavioral;

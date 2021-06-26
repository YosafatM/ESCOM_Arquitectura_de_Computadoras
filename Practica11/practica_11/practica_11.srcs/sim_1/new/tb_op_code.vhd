library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_op_code is
--  Port ( );
end tb_op_code;

architecture Behavioral of tb_op_code is
    component memoria_op_code is
        generic (
            m : integer := 5;
            n : integer := 20
        );
        Port ( index : in STD_LOGIC_VECTOR (m-1 downto 0);
               code : out STD_LOGIC_VECTOR (n-1 downto 0)
        );
    end component;

    signal opCode : STD_LOGIC_VECTOR (4 downto 0);
    signal microOpCode : STD_LOGIC_VECTOR (19 downto 0);
begin
    op : memoria_op_code Port map ( 
        index => OpCode,
        code => microOpCode
    );
    
    process
    begin
        opCode <= "00000";
        wait for 10 ns;
        opCode <= "00001";
        wait for 10 ns;
        opCode <= "00010";
        wait for 10 ns;
        opCode <= "00011";
        wait for 10 ns;
        opCode <= "00100";
        wait for 10 ns;
        opCode <= "00101";
        wait for 10 ns;
        opCode <= "00110";
        wait for 10 ns;
        opCode <= "00111";
        wait for 10 ns;
        opCode <= "01000";
        wait;
    end process;
end Behavioral;

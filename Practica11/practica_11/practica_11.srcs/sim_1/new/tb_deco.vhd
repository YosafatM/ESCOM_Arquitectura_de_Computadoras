library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_deco is
--  Port ( );
end tb_deco;

architecture Behavioral of tb_deco is
    component decodificador is
        Port (
            id : in STD_LOGIC_VECTOR (4 downto 0);
            TIPOR, BEQI, BNEI, BLTI, BLETI, BGTI, BGETI : out STD_LOGIC
        );
    end component;
            
    signal opCode : STD_LOGIC_VECTOR (4 downto 0);
    signal TIPOR, BEQI, BNEQI, BLTI, BLETI, BGTI, BGETI : STD_LOGIC;
    
begin
    deco : decodificador Port map (
        id => opCode,
        TIPOR => TIPOR,
        BEQI => BEQI,
        BNEI => BNEQI,
        BLTI => BLTI,
        BLETI => BLETI,
        BGTI => BGTI,
        BGETI => BGETI
    );
    
    process
    begin
        opCode <= "00000";
        wait for 10 ns;
        opCode <= "01101";
        wait for 10 ns;
        opCode <= "01110";
        wait for 10 ns;
        opCode <= "01111";
        wait for 10 ns;
        opCode <= "10000";
        wait for 10 ns;
        opCode <= "10001";
        wait for 10 ns;
        opCode <= "10010";
        wait;
    end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodificador is
    Port (
        id : in STD_LOGIC_VECTOR (4 downto 0);
        TIPOR, BEQI, BNEI, BLTI, BLETI, BGTI, BGETI : out STD_LOGIC
    );
end decodificador;

architecture Behavioral of decodificador is
begin
    with id select
        TIPOR <= '1' when "00000",
                '0' when others;
    
    with id select
        BEQI <= '1' when "01101",
                '0' when others;
                
    with id select
        BNEI <= '1' when "01110",
                '0' when others;
                
    with id select
        BLTI <= '1' when "01111",
                '0' when others;
                
    with id select
        BLETI <= '1' when "10000",
                '0' when others;
                
    with id select
        BGTI <= '1' when "10001",
                '0' when others;
                
    with id select
        BGETI <= '1' when "10010",
                '0' when others;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memoria_fun_code is
    generic (
        m : integer := 4;
        n : integer := 20
    );
    Port ( index : in STD_LOGIC_VECTOR (m-1 downto 0);
           code : out STD_LOGIC_VECTOR (n-1 downto 0)
    );
end entity;

architecture Behavioral of memoria_fun_code is
type arreglo is array (0 to (2**m - 1)) of STD_LOGIC_VECTOR (n-1 downto 0);
signal mem : arreglo := (others=>(others=>'0'));

begin
    mem(0) <= "00000100010000110011"; --ADD
    mem(1) <= "00000100010001110011"; --SUB
    mem(2) <= "00000100010000000011"; --AND
    mem(3) <= "00000100010000010011"; --OR
    mem(4) <= "00000100010000100011"; --XOR
    mem(5) <= "00000100010011010011"; --NAND
    mem(6) <= "00000100010011000011"; --NOR
    mem(7) <= "00000100010001100011"; --XNOR
    mem(8) <= "00000100010011000011"; --NOT
    mem(9) <= "00000001110000000000"; --SLL
    mem(10) <= "00000001010000000000"; --SRL

    code <= mem(conv_integer(index));
end Behavioral;

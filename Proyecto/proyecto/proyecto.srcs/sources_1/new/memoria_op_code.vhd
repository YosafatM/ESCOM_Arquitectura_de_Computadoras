library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memoria_op_code is
    generic (
        m : integer := 5;
        n : integer := 20
    );
    Port ( index : in STD_LOGIC_VECTOR (m-1 downto 0);
           code : out STD_LOGIC_VECTOR (n-1 downto 0)
    );
end entity;

architecture Behavioral of memoria_op_code is
type arreglo is array (0 to (2**m - 1)) of STD_LOGIC_VECTOR (n-1 downto 0);
signal mem : arreglo := (others=>(others=>'0'));
begin
    mem(0) <= "00001000000001110001"; --Verificacion
    mem(1) <= "00000000010000000000"; --LI
    mem(2) <= "00000100010000001000"; --LWI
    mem(3) <= "00001000000000001100"; --SWI
    mem(4) <= "00001010000100110101"; --SW
    mem(5) <= "00000100010100110011"; --ADDI
    mem(6) <= "00000100010101110011"; --SUBI
    mem(7) <= "00000110010100000011"; --ANDI
    mem(8) <= "00000110010100010011"; --ORI
    mem(9) <= "00000100010100100011"; --XORI
    mem(10) <= "00000100010111010011"; --NANDI
    mem(11) <= "00000100010111000011"; --NORI
    mem(12) <= "00000100010101100011"; --XNORI
    
    mem(13) <= "10010000001100110011"; --BEQI
    mem(14) <= "10010000001100110011"; --BNEI
    mem(15) <= "10010000001100110011"; --BLTI
    mem(16) <= "10010000001100110011"; --BLETI
    mem(17) <= "10010000001100110011"; --BGTI
    mem(18) <= "10010000001100110011"; --BGETI
    
    mem(19) <= "00010000000000000000"; --B
    mem(20) <= "01010000000000000000"; --CALL
    mem(21) <= "00100000000000000000"; --RET
    mem(22) <= "00000000000000000000"; --NOP
    mem(23) <= "00000110010100110001"; --LW

    code <= mem(conv_integer(index));
end Behavioral;
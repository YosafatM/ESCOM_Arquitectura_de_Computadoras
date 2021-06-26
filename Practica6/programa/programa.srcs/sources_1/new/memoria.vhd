library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memoria is
    generic (
        m : integer := 10;
        n : integer := 25
    );
    Port ( pc : in STD_LOGIC_VECTOR (m-1 downto 0);
           inst : out STD_LOGIC_VECTOR (n-1 downto 0)
           );
end entity;

architecture Behavioral of memoria is
type arreglo is array (0 to (2**m - 1)) of STD_LOGIC_VECTOR (n-1 downto 0);
signal mem : arreglo := (others=>(others=>'0'));

constant code_LI : std_logic_vector (4 downto 0) := "00001";
constant code_ADD : std_logic_vector (4 downto 0) := "00000";
constant code_SWI : std_logic_vector (4 downto 0) := "00011";
constant code_ADDI : std_logic_vector (4 downto 0) := "00101";
constant code_BNEI : std_logic_vector (4 downto 0) := "01110";
constant code_NOP : std_logic_vector (4 downto 0) := "10110";

begin
    mem(0) <= code_LI & "0000" & "000000000000" & "0000";
    mem(1) <= code_LI & "0001" & "000000000000" & "0001";
    mem(2) <= code_LI & "0010" & "000000000000" & "0000";
    mem(3) <= code_LI & "0011" & "000000000000" & "1100";
    
    mem(4) <= code_ADD & "0100" & "0000" & "0001" & "00000000";
    mem(5) <= code_SWI & "0100" & "00000000" & "0111" & "0010";
    
    mem(6) <= code_ADDI & "0000" & "0001" & "000000000000";
    mem(7) <= code_ADDI & "0001" & "0100" & "000000000000";
    
    mem(8) <= code_ADDI & "0010" & "0010" & "000000000001";
    
    mem(9) <= code_BNEI & "0011" & "0010" & "111111111011";
    
    mem(10) <= code_NOP & "00000000000000000000";

    inst <= mem(conv_integer(pc));
end Behavioral;

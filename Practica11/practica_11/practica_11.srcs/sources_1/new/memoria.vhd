library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memoria_dato is
    generic (
        m : integer := 10;
        n : integer := 16
    );
    Port ( add : in STD_LOGIC_VECTOR (m-1 downto 0);
           dataIn : in STD_LOGIC_VECTOR (n-1 downto 0);
           clk, WD : in STD_LOGIC;
           dataOut : out STD_LOGIC_VECTOR (n-1 downto 0)
    );
end entity;

architecture Behavioral of memoria_dato is
type arreglo is array (0 to (2**m - 1)) of STD_LOGIC_VECTOR (n-1 downto 0);
signal mem : arreglo := (others=>(others=>'0'));
begin
    process (clk)
    begin
        if (rising_edge(clk)) then
            if (WD = '1') then
                mem(conv_integer(add)) <= dataIn;
            end if;
        end if;
    end process;
    
    dataOut <= mem(conv_integer(add));
end Behavioral;

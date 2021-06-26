library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity banderas is
    Port (
        LF, CLK, CLR : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR (3 downto 0);
        Q : out STD_LOGIC_VECTOR (3 downto 0)
    );
end banderas;

architecture Behavioral of banderas is
signal reg : STD_LOGIC_VECTOR (3 downto 0);
begin
    process (CLK, CLR, D)
    begin
        if (CLR = '1') then
            reg <= "0000";
        elsif falling_edge(CLK) then
            if (LF = '1') then
                reg <= D;
            else
                reg <= "0000";
            end if;
        end if;
    end process;
    
    Q <= reg;
end Behavioral;

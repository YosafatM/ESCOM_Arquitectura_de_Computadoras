library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arreglo is
    Port (
        LA, EA, CLK, CLR : in STD_LOGIC;
        DA : in STD_LOGIC_VECTOR (8 downto 0);
        QA : out STD_LOGIC_VECTOR (8 downto 0)
    );
end arreglo;

architecture Behavioral of arreglo is
signal FF : STD_LOGIC_VECTOR (8 downto 0);
begin
    process (CLK, CLR)
	begin
		if CLR = '1' then
			FF <= "000000000";
		elsif rising_edge(CLK) then
			if LA = '1' then --Carga
				FF <= DA;
			elsif EA = '1' then --Corrimiento
				for i in 0 to 7 loop
					FF(i) <= FF(i + 1);
				end loop;

				FF(8) <= '0';
			else --Retención
				FF <= FF;
			end if;
		end if;
	end process;
	
	QA <= FF;
end Behavioral;

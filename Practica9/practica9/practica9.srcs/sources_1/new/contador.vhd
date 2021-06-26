library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity contador is
    Port (
        LB, EB, CLK, CLR : in STD_LOGIC;
        QB : out STD_LOGIC_VECTOR (3 downto 0)
    );
end contador;

architecture Behavioral of contador is
signal COUNT : std_logic_vector (3 downto 0);
begin
	process (CLK, CLR)
	begin
		if (CLR = '1') then
			COUNT <= "0000";
		elsif (rising_edge(CLK)) then
			if (LB = '0' and EB = '0') then --retiene
				COUNT <= COUNT;
			elsif (LB = '1') then --carga
				COUNT <= "0000";
			else --conteo ascendente
				COUNT <= COUNT + 1;
			end if;
		end if;
	end process;
	
	QB <= COUNT;
end architecture;

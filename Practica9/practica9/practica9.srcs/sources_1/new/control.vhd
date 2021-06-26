library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control is
    Port ( 
        CLK, CLR, Z, A0, INI : in STD_LOGIC;
        LA, LB, EA, EB, EC : out STD_LOGIC
    );
end control;

architecture Behavioral of control is
type estado is (E0, E1, E2);
signal actual, sig : estado;
begin
	--Para el registro del estado
	process (CLK, CLR)
	begin
		if CLR = '1' then
			actual <= E0;
		elsif rising_edge(CLK) then
			actual <= sig;
		end if;
	end process;

	--Para cambiar el estado
	process (actual, Z, INI, A0)
	begin
		LA <= '0';
		LB <= '0';
		EA <= '0';
		EB <= '0';
		EC <= '0';

		case actual is
			when E0 =>
				LB <= '1';

				if INI = '1' then
					sig <= E1;
				else
				    LA <= '1';
					sig <= E0;
				end if;
			when E1 =>
				EA <= '1';

				if Z = '0' then
					sig <= E1;

					if A0 = '1' then
						EB <= '1';
					end if;
				else
					sig <= E2;
				end if;
			when others =>
				EC <= '1';

				if INI = '1' then
					sig <= E2;
				else
					sig <= E0;
				end if;
		end case;
	end process;
end architecture;
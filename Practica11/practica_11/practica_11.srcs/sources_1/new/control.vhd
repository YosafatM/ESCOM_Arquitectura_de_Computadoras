library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control is
    Port (
        CLK, CLR, EQ, NE, LT, LE, GT, GE, NA, TIPOR, BEQI, BNEI, BLTI, BLETI, BGTI, BGETI : in STD_LOGIC;
        SDOPC, SM : out STD_LOGIC
    );
end control;

architecture Behavioral of control is
type estado is (E0);
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
	
    process(actual, EQ, NE, LT, LE, GT, GE, NA, BGETI, BGTI, BLETI, BLTI, BNEI, BEQI, TIPOR)
	begin
		SDOPC <= '0';
		SM <= '0';
		case actual is
            when e0 =>
                if (TIPOR = '1') then
                    SM <= '0';
                else
                    if (BEQI = '0') then
                        if (BNEI = '0') then 
                            if (BLTI = '0') then
                                if (BLETI = '0') then
                                    if (BGTI = '0') then
                                       if (BGETI = '0') then
                                            SM <= '1';
                                            SDOPC <= '1';
                                       else --BGETI 1
                                            if (NA = '1') then
                                                SM <= '1';
                                                SDOPC <= '0';
                                            else --NA 0
                                                if (GE = '1') then
                                                    SM <= '1';
                                                    SDOPC <= '1';
                                                else --GE 0
                                                    SM <= '1';
                                                    SDOPC <= '0';
                                                end if;  
                                            end if;
                                       end if;
                                    else -- BGTI 1
                                        if (NA = '1') then
                                            SM <= '1';
                                            SDOPC <= '0';
                                        else --NA 0
                                            if (GT = '1') then
                                                SM <= '1';
                                                SDOPC <= '1';
                                            else --GT 0
                                                SM <= '1';
                                                SDOPC <= '0';
                                            end if;  
                                        end if;
                                    end if;
                                else --BLETI 1
                                    if (NA = '1') then
                                        SM <= '1';
                                        SDOPC <= '0';
                                    else --NA 0
                                        if (LE = '1') then
                                            SM <= '1';
                                            SDOPC <= '1';
                                        else --LE 0
                                            SM <= '1';
                                            SDOPC <= '0';
                                        end if;  
                                    end if;
                                end if;
                            else --BLTI 1
                                if (NA = '1') then
                                    SM <= '1';
                                    SDOPC <= '0';
                                else --NA 0
                                    if (LT = '1') then
                                        SM <= '1';
                                        SDOPC <= '1';
                                    else --LT 0
                                        SM <= '1';
                                        SDOPC <= '0';
                                    end if;  
                                end if;
                            end if;
                        else --BNEQI 1
                            if (NA = '1') then
                                SM <= '1';
                                SDOPC <= '0';
                            else --NA 0
                                if (NE = '1') then
                                    SM <= '1';
                                    SDOPC <= '1';
                                else --NE 0
                                    SM <= '1';
                                    SDOPC <= '0';
                                end if;  
                            end if;
                        end if;
                    else --BEQI 1
                        if (NA = '1') then
                            SM <= '1';
                            SDOPC <= '0';
                        else --NA 0
                            if (EQ = '1') then
                                SM <= '1';
                                SDOPC <= '1';
                            else --EQ 0
                                SM <= '1';
                                SDOPC <= '0';
                            end if;  
                        end if;
                    end if;
                end if;
                
		        sig <= e0;
		end case;
	end process;
end Behavioral;

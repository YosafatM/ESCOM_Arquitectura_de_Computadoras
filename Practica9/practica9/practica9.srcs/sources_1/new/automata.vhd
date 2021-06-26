library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_misc.all;
use work.componentes.all;

entity automata is
    Port (
        CLK, CLR, INI : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR (8 downto 0);
        ARR : out STD_LOGIC_VECTOR (8 downto 0);
        S : out STD_LOGIC_VECTOR (6 downto 0)
    );
end automata;

architecture Behavioral of automata is
signal EA, EB, EC, LA, LB, A0, Z : STD_LOGIC;
signal QA : STD_LOGIC_VECTOR (8 downto 0);
signal QB : STD_LOGIC_VECTOR (3 downto 0);
signal NUM : STD_LOGIC_VECTOR (6 downto 0);
begin
    c_control : control port map (
        CLK => CLK,
        CLR => CLR,
        Z => Z,
        A0 => A0,
        INI => INI,
        LA => LA,
        LB => LB,
        EA => EA,
        EB => EB,
        EC => EC
    );
    
    c_arreglo : arreglo port map (
        LA => LA,
        EA => EA,
        CLK => CLK,
        CLR => CLR,
        DA => D,
        QA => QA
    );
    
    c_contador : contador port map (
        LB => LB,
        EB => EB,
        CLK => CLK,
        CLR => CLR,
        QB => QB
    );
    
    c_decodificador : decodificador port map (
        QB => QB,
        NUM => NUM
    );
    
    A0 <= QA(0);
    Z <= or_reduce(QA);
    ARR <= QA;
    
    with EC select
		S <= NUM when '1',
			 "0000001" when others;
end Behavioral;

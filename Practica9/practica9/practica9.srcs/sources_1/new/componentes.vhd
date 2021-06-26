library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package componentes is
    component control is
        Port ( 
            CLK, CLR, Z, A0, INI : in STD_LOGIC;
            LA, LB, EA, EB, EC : out STD_LOGIC
        );
    end component;
    
    component arreglo is
        Port (
            LA, EA, CLK, CLR : in STD_LOGIC;
            DA : in STD_LOGIC_VECTOR (8 downto 0);
            QA : out STD_LOGIC_VECTOR (8 downto 0)
        );
    end component;
    
    component contador is
        Port (
            LB, EB, CLK, CLR : in STD_LOGIC;
            QB : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    
    component decodificador is
        Port (
            QB : in STD_LOGIC_VECTOR (3 downto 0);
            NUM : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;
end package;

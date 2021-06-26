library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package PAQUETE_COMPONENTES is
    component memoria_op_code is
        generic (
            m : integer := 5;
            n : integer := 20
        );
        Port ( index : in STD_LOGIC_VECTOR (m-1 downto 0);
               code : out STD_LOGIC_VECTOR (n-1 downto 0)
        );
    end component;
    
    component memoria_fun_code is
        generic (
            m : integer := 4;
            n : integer := 20
        );
        Port ( index : in STD_LOGIC_VECTOR (m-1 downto 0);
               code : out STD_LOGIC_VECTOR (n-1 downto 0)
        );
    end component;
    
    component decodificador is
        Port (
            id : in STD_LOGIC_VECTOR (4 downto 0);
            TIPOR, BEQI, BNEI, BLTI, BLETI, BGTI, BGETI : out STD_LOGIC
        );
    end component;
    
    component banderas is
        Port (
            LF, CLK, CLR : in STD_LOGIC;
            D : in STD_LOGIC_VECTOR (3 downto 0);
            Q : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;
    
    component condiciones is
        Port (
            Q : in STD_LOGIC_VECTOR (3 downto 0);
            EQ, NE, LT, LE, GT, GE : out STD_LOGIC
        );
    end component;
    
    component control is
        Port (
            CLK, CLR : in STD_LOGIC;
            EQ, NE, LT, LE, GT, GE, NA : in STD_LOGIC;
            TIPOR, BEQI, BNEI, BLTI, BLETI, BGTI, BGETI : in STD_LOGIC;
            SDOPC, SM : out STD_LOGIC
        );
    end component;
    
    component nivel is
        Port (
            CLK, CLR : in STD_LOGIC;
            NA : out STD_LOGIC
        );
    end component;
end package;

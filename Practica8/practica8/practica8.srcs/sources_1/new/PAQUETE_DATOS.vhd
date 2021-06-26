library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


package PAQUETE_DATOS is
    component archivo_registro is
        Port ( readReg1, readReg2, writeReg : in STD_LOGIC_VECTOR (3 downto 0);
               shamt : in STD_LOGIC_VECTOR (3 downto 0);
               writeData : in STD_LOGIC_VECTOR (15 downto 0);
               clk, clear, dir, SHE, WR : in STD_LOGIC;
               readData1, readData2 : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;
    
    component alu is
        generic (
            m : integer := 16
        );
        Port ( A, B : in STD_LOGIC_VECTOR (m-1 downto 0);
               op : in STD_LOGIC_VECTOR (3 downto 0);
               OV, Z, C, N : out STD_LOGIC;
               R : inout STD_LOGIC_VECTOR (m-1 downto 0)
        );
    end component;
    
    component memoria_dato is
        generic (
            m : integer := 10;
            n : integer := 16
        );
        Port ( add : in STD_LOGIC_VECTOR (m-1 downto 0);
               dataIn : in STD_LOGIC_VECTOR (n-1 downto 0);
               clk, WD : in STD_LOGIC;
               dataOut : out STD_LOGIC_VECTOR (n-1 downto 0)
        );
    end component;
    
    component memoria_programa is
        generic (
            m : integer := 10;
            n : integer := 25
        );
        Port ( pc : in STD_LOGIC_VECTOR (m-1 downto 0);
               inst : out STD_LOGIC_VECTOR (n-1 downto 0)
        );
    end component;
    
    component pila is
        generic (
            pc_size : integer := 16;
            n : integer := 3
        );
        Port ( PC_in : in STD_LOGIC_VECTOR (pc_size-1 downto 0);
               clk, clr, WPC, UP, DW : in STD_LOGIC;
               PC_out : out STD_LOGIC_VECTOR (pc_size-1 downto 0);
               SP : out STD_LOGIC_VECTOR (n-1 downto 0)
        );
    end component;
end package;

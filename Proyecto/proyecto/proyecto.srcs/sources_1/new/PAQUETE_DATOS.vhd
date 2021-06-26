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
            m : integer := 9;
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
            m : integer := 9;
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
    
    component unidad_control is
        Port (
            CLK, CLR : in STD_LOGIC;
            D, sufix : in STD_LOGIC_VECTOR (3 downto 0);
            prefix : in STD_LOGIC_VECTOR (4 downto 0);
            microinst : out STD_LOGIC_VECTOR (19 downto 0)
        );
    end component;

    component ruta is
        Port (
            clk, clr, WPC, UP, DW, SHE, DIR, WR, WD, SR2, SWD, SR, SDMP, SDMD, SOP1, SOP2, SEXT : in STD_LOGIC;
            alu_op : in STD_LOGIC_VECTOR (3 downto 0);
            prefix : out STD_LOGIC_VECTOR (4 downto 0);
            flags, sufix : out STD_LOGIC_VECTOR (3 downto 0);
            t_alu, t_RR1, t_RR2, t_PC, t_bus_SR : out STD_LOGIC_VECTOR (15 downto 0);
            t_inst : out STD_LOGIC_VECTOR (24 downto 0)
        );
    end component;
end package;

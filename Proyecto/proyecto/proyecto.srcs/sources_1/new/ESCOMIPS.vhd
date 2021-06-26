library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.PAQUETE_DATOS.ALL;

entity ESCOMIPS is
    Port (
        CLR, CLK : in STD_LOGIC;
        t_alu, t_RR1, t_RR2, t_PC, t_bus_SR : out STD_LOGIC_VECTOR (15 downto 0);
        t_inst : out STD_LOGIC_VECTOR (24 downto 0);
        t_micro : out STD_LOGIC_VECTOR (19 downto 0)
    );
end ESCOMIPS;

architecture Behavioral of ESCOMIPS is
signal D, fun_code : STD_LOGIC_VECTOR (3 downto 0);
signal op_code : STD_LOGIC_VECTOR (4 downto 0);
signal microinst : STD_LOGIC_VECTOR (19 downto 0);

begin
    unidad : unidad_control Port map (
        CLK => CLK,
        CLR => CLR,
        D => D,
        sufix => fun_code,
        prefix => op_code,
        microinst => microinst
    );
    
    datos : ruta Port map (
        clk => CLK,
        clr => CLR,
        WPC => microinst(16),
        UP => microinst(18),
        DW => microinst(17),
        SHE => microinst(12),
        DIR => microinst(11),
        WR => microinst(10),
        WD => microinst(2),
        SR2 => microinst(15),
        SWD => microinst(14),
        SR => microinst(1),
        SDMP => microinst(19),
        SDMD => microinst(3),
        SOP1 => microinst(9),
        SOP2 => microinst(8),
        SEXT => microinst(13),
        alu_op => microinst(7 downto 4),
        prefix => op_code,
        flags => D,
        sufix => fun_code,
        t_alu => t_alu,
        t_RR1 => t_RR1,
        t_RR2 => t_RR2,
        t_PC => t_PC,
        t_bus_SR => t_bus_SR,
        t_inst => t_inst
    );
    
    t_micro <= microinst;
end Behavioral;

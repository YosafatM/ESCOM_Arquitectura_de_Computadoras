library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.PAQUETE_COMPONENTES.ALL;

entity unidad_control is
    Port (
        CLK, CLR : in STD_LOGIC;
        D, sufix : in STD_LOGIC_VECTOR (3 downto 0);
        prefix : in STD_LOGIC_VECTOR (4 downto 0);
        microinst : out STD_LOGIC_VECTOR (19 downto 0)
    );
end unidad_control;

architecture Behavioral of unidad_control is
signal index_op : STD_LOGIC_VECTOR (4 downto 0);
signal Q : STD_LOGIC_VECTOR (3 downto 0);
signal out_op, out_fun, output : STD_LOGIC_VECTOR (19 downto 0);
signal s_TIPOR, s_BEQI, s_BNEI, s_BLTI, s_BLETI, s_BGTI, s_BGETI : STD_LOGIC;
signal s_EQ, s_NE, s_LT, s_LE, s_GT, s_GE, SDOPC, SM, NA : STD_LOGIC;
begin
    t_mem_op : memoria_op_code Port map (
        index => index_op,
        code => out_op
    );
    
    t_mem_fun : memoria_fun_code Port map (
        index => sufix,
        code => out_fun
    );
    
    t_deco : decodificador Port map (
        id => prefix,
        TIPOR => s_TIPOR,
        BEQI => s_BEQI,
        BNEI => s_BNEI,
        BLTI => s_BLTI,
        BLETI => s_BLETI,
        BGTI => s_BGTI,
        BGETI => s_BGETI
    );
    
    t_banderas : banderas Port map (
        LF => output(0),
        CLK => CLK,
        CLR => CLR,
        D => D,
        Q => Q
    );
    
    t_condiciones : condiciones Port map (
        Q => Q,
        EQ => s_EQ,
        NE => s_NE,
        LT => s_LT,
        LE => s_LE,
        GT => s_GT,
        GE => s_GE
    );
    
    t_control : control Port map (
        CLK => CLK,
        CLR => CLR,
        EQ => s_EQ,
        NE => s_NE,
        LT => s_LT,
        LE => s_LE,
        GT => s_GT,
        GE => s_GE,
        NA => NA,
        TIPOR => s_TIPOR,
        BEQI => s_BEQI,
        BNEI => s_BNEI,
        BLTI => s_BLTI,
        BLETI => s_BLETI,
        BGTI => s_BGTI,
        BGETI => s_BGETI,
        SDOPC => SDOPC,
        SM => SM
    );
    
    t_nivel : nivel Port map (
        CLK => CLK,
        CLR => CLR,
        NA => NA
    );

    with SDOPC select
        index_op <= "00000" when '0',
                    prefix when others;
                    
    with SM select
        output <= out_fun when '0',
                    out_op when others;
                    
    microinst <= output;
end Behavioral;

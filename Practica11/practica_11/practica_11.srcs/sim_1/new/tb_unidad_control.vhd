library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;
use IEEE.std_logic_TEXTIO.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_unidad_control is
--  Port ( );
end tb_unidad_control;

architecture Behavioral of tb_unidad_control is
constant clk_period : time := 10 ns;

component unidad_control is
    Port (
        CLK, CLR, LF : in STD_LOGIC;
        D, sufix : in STD_LOGIC_VECTOR (3 downto 0);
        prefix : in STD_LOGIC_VECTOR (4 downto 0);
        microinst : out STD_LOGIC_VECTOR (19 downto 0)
    );
end component;

signal CLK, CLR, LF : STD_LOGIC;
signal D, sufix : STD_LOGIC_VECTOR (3 downto 0);
signal prefix : STD_LOGIC_VECTOR (4 downto 0);
signal microinst : STD_LOGIC_VECTOR (19 downto 0);
begin
    t_unidad : unidad_control port map (
        CLK => CLK,
        CLR => CLR,
        LF =>LF,
        D => D,
        sufix => sufix,
        prefix => prefix,
        microinst => microinst
    );

    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
   
    sim_proc: process
    constant ALTO : string (1 to 4) := "ALTO";
    constant BAJO : string (1 to 4) := "BAJO";
    file ARCH_SALIDA : TEXT;																					
    variable LINEA_SALIDA : line;
    
    file ARCH_ENTRADA : TEXT;
    variable LINEA_ENTRADA : line;
    variable CADENA_1 : string (1 to 8);
    variable CADENA_2 : string (1 to 20);
    variable CADENA_3 : string (1 to 5);
    
    variable v_CLK, v_CLR, v_LF : STD_LOGIC;
    variable v_D, v_sufix : STD_LOGIC_VECTOR (3 downto 0);
    variable v_prefix : STD_LOGIC_VECTOR (4 downto 0);
    variable v_microinst : STD_LOGIC_VECTOR (19 downto 0);
    begin		
        file_open(ARCH_ENTRADA, "C:\Users\yosaf\Desktop\Sexto\Arquitectura\Practica11\entradas.txt", READ_MODE); 	
        file_open(ARCH_SALIDA, "C:\Users\yosaf\Desktop\Sexto\Arquitectura\Practica11\salidas.txt", WRITE_MODE);
        readline(ARCH_ENTRADA, LINEA_ENTRADA); -- salta la primera linea
    
        CADENA_1 := " OP_CODE";
        write(LINEA_SALIDA, CADENA_1, right, CADENA_1'LENGTH + 1);
        CADENA_1 := "FUN_CODE";
        write(LINEA_SALIDA, CADENA_1, right, CADENA_1'LENGTH + 1);
        CADENA_1 := "BANDERAS";
        write(LINEA_SALIDA, CADENA_1, right, CADENA_1'LENGTH + 1);
        CADENA_3 := "  CLR";
        write(LINEA_SALIDA, CADENA_3, right, CADENA_3'LENGTH + 1);
        CADENA_3 := "   LF";
        write(LINEA_SALIDA, CADENA_3, right, CADENA_3'LENGTH + 1);
        CADENA_2 := "    MICROINSTRUCCION";
        write(LINEA_SALIDA, CADENA_2, right, CADENA_2'LENGTH + 1);
        CADENA_3 := "NIVEL";
        write(LINEA_SALIDA, CADENA_3, right, CADENA_3'LENGTH + 1);
        
        writeline(ARCH_SALIDA, LINEA_SALIDA);-- escribe la linea en el archivo
    
        FOR I IN 1 TO 52 LOOP
            readline(ARCH_ENTRADA, LINEA_ENTRADA); -- lee una linea completa
            
            read(LINEA_ENTRADA, v_prefix);
            prefix <= v_prefix;
            read(LINEA_ENTRADA, v_sufix);
            sufix <= v_sufix;
            read(LINEA_ENTRADA, v_D);
            D <= v_D;
            read(LINEA_ENTRADA, v_CLR);
            CLR <= v_CLR;
            read(LINEA_ENTRADA, v_LF);
            LF <= v_LF;
            
            WAIT UNTIL RISING_EDGE(CLK);	--ESPERO AL FLANCO
            
            v_microinst := microinst;
            write(LINEA_SALIDA, v_prefix, right, 8);
            write(LINEA_SALIDA, v_sufix, right, 9);
            write(LINEA_SALIDA, v_D, right, 9);
            write(LINEA_SALIDA, v_CLR, right, 6);
            write(LINEA_SALIDA, v_LF, right, 6);
            write(LINEA_SALIDA, v_microinst, right, 22);
            write(LINEA_SALIDA, ALTO, right, 6);
            writeline(ARCH_SALIDA, LINEA_SALIDA);
            
            WAIT UNTIL FALLING_EDGE(CLK);
            
            v_microinst := microinst;
            write(LINEA_SALIDA, v_prefix, right, 8);
            write(LINEA_SALIDA, v_sufix, right, 9);
            write(LINEA_SALIDA, v_D, right, 9);
            write(LINEA_SALIDA, v_CLR, right, 6);
            write(LINEA_SALIDA, v_LF, right, 6);
            write(LINEA_SALIDA, v_microinst, right, 22);
            write(LINEA_SALIDA, BAJO, right, 6);
            writeline(ARCH_SALIDA, LINEA_SALIDA);
            
        end loop;
        file_close(ARCH_ENTRADA);  -- cierra el archivo
        file_close(ARCH_SALIDA);  -- cierra el archivo
    
      wait;
    end process;
end Behavioral;

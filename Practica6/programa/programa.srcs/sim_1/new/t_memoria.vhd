library IEEE;
library STD;
use STD.TEXTIO.ALL;
use IEEE.std_logic_TEXTIO.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity t_memoria is
--  Port ( );
end t_memoria;

architecture Behavioral of t_memoria is
constant m : integer := 10;
constant n : integer := 25;
constant period : time := 20 ns;

component memoria is generic (
        m : integer := m;
        n : integer := n
    );
    Port ( 
        pc : in STD_LOGIC_VECTOR (m-1 downto 0);
        inst : out STD_LOGIC_VECTOR (n-1 downto 0)
    );
end component;

signal pc : STD_LOGIC_VECTOR (m-1 downto 0) := (others => '0');
signal inst : STD_LOGIC_VECTOR (n-1 downto 0);
begin
    test: memoria port map ( 
        pc => pc,
        inst => inst
    );
   
    stim_proc: process
    file ARCH_SALIDA : TEXT;																					
    variable LINEA_SALIDA : line;
    variable v_inst : STD_LOGIC_VECTOR (n-1 downto 0);
    
    file ARCH_ENTRADA : TEXT;
    variable LINEA_ENTRADA : line;
    variable CADENA : string (1 to 7);
    variable v_pc : STD_LOGIC_VECTOR (m-1 downto 0);
    begin		
        file_open(ARCH_ENTRADA, "C:\Users\yosaf\Desktop\Sexto\Arquitectura\Practica6\entradas2.txt", READ_MODE); 	
        file_open(ARCH_SALIDA, "C:\Users\yosaf\Desktop\Sexto\Arquitectura\Practica6\salidas2.txt", WRITE_MODE); 	
    
        CADENA := "     PC";
        write(LINEA_SALIDA, CADENA, right, CADENA'LENGTH + 1);
        CADENA := " OPCODE";
        write(LINEA_SALIDA, CADENA, right, CADENA'LENGTH + 1);
        CADENA := " 19..16";
        write(LINEA_SALIDA, CADENA, right, CADENA'LENGTH + 1);
        CADENA := " 15..12";
        write(LINEA_SALIDA, CADENA, right, CADENA'LENGTH + 1);
        CADENA := "  11..8";
        write(LINEA_SALIDA, CADENA, right, CADENA'LENGTH + 1);
        CADENA := "   7..4";
        write(LINEA_SALIDA, CADENA, right, CADENA'LENGTH + 1);
        CADENA := "   3..0";
        write(LINEA_SALIDA, CADENA, right, CADENA'LENGTH + 1);
        
        
        writeline(ARCH_SALIDA, LINEA_SALIDA);-- escribe la linea en el archivo
    
        WAIT FOR 100 NS;
        FOR I IN 0 TO 9 LOOP
            readline(ARCH_ENTRADA, LINEA_ENTRADA); -- lee una linea completa
            
            Hread(LINEA_ENTRADA, v_pc);
            pc <= v_pc;
            
            wait for 20 ns; 
    
            v_inst := inst;
            
            Hwrite(LINEA_SALIDA, v_pc, right, 9);
            write(LINEA_SALIDA, v_inst(24 downto 20), right, 7);
            write(LINEA_SALIDA, v_inst(19 downto 16), right, 7);
            write(LINEA_SALIDA, v_inst(15 downto 12), right, 8);
            write(LINEA_SALIDA, v_inst(11 downto 8), right, 9);
            write(LINEA_SALIDA, v_inst(7 downto 4), right, 8);
            write(LINEA_SALIDA, v_inst(3 downto 0), right, 8);
            
            writeline(ARCH_SALIDA, LINEA_SALIDA);-- escribe la linea en el archivo
            
        end loop;
        file_close(ARCH_ENTRADA);  -- cierra el archivo
        file_close(ARCH_SALIDA);  -- cierra el archivo
    
      wait;
    end process;
end Behavioral;

library IEEE;
library STD;
use STD.TEXTIO.ALL;
use IEEE.std_logic_TEXTIO.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity t_memoria is
--  Port ( );
end t_memoria;

architecture Behavioral of t_memoria is
constant m : integer := 11;
constant n : integer := 16;
constant clk_period : time := 10 ns;

component memoria is generic (
        m : integer := m;
        n : integer := n
    );
    Port ( add : in STD_LOGIC_VECTOR (m-1 downto 0);
       dataIn : in STD_LOGIC_VECTOR (n-1 downto 0);
       clk, WD : in STD_LOGIC;
       dataOut : out STD_LOGIC_VECTOR (n-1 downto 0)
    );
end component;

signal add : STD_LOGIC_VECTOR (m-1 downto 0);
signal dataIn : STD_LOGIC_VECTOR (n-1 downto 0);
signal clk, WD : STD_LOGIC;
signal dataOut : STD_LOGIC_VECTOR (n-1 downto 0);
begin
    test: memoria port map ( 
        add => add,
        dataIn => dataIn,
        clk => clk,
        WD => WD,
        dataOut => dataOut
    );

   clk_process : process
   begin
		CLK <= '0';
		  wait for clk_period/2;
		CLK <= '1';
		  wait for clk_period/2;
   end process;
   
    stim_proc: process
    file ARCH_SALIDA : TEXT;																					
    variable LINEA_SALIDA : line;
    variable var_result_1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    variable var_result_2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    
    file ARCH_ENTRADA : TEXT;
    variable LINEA_ENTRADA : line;
    variable CADENA : string (1 to 4);
    variable v_add : STD_LOGIC_VECTOR (m-1 downto 0);
    variable v_dataIn : STD_LOGIC_VECTOR (n-1 downto 0);
    variable v_WD : STD_LOGIC;
    variable v_dataOut : STD_LOGIC_VECTOR (n-1 downto 0);
    begin		
        file_open(ARCH_ENTRADA, "C:\Users\yosaf\Desktop\Sexto\Arquitectura\Practica6\entradas1.txt", READ_MODE); 	
        file_open(ARCH_SALIDA, "C:\Users\yosaf\Desktop\Sexto\Arquitectura\Practica6\salidas1.txt", WRITE_MODE); 	
    
        CADENA := " ADD";
        write(LINEA_SALIDA, CADENA, right, CADENA'LENGTH + 1);
        CADENA := "  WD";
        write(LINEA_SALIDA, CADENA, right, CADENA'LENGTH + 1);
        CADENA := " DIN";
        write(LINEA_SALIDA, CADENA, right, CADENA'LENGTH + 1);
        CADENA := "DOUT";
        write(LINEA_SALIDA, CADENA, right, CADENA'LENGTH + 1);
        
        writeline(ARCH_SALIDA, LINEA_SALIDA);-- escribe la linea en el archivo
    
        WAIT FOR 100 NS;
        FOR I IN 0 TO 11 LOOP
            readline(ARCH_ENTRADA, LINEA_ENTRADA); -- lee una linea completa
            
            Hread(LINEA_ENTRADA, v_add);
            add <= v_add;
            Hread(LINEA_ENTRADA, v_dataIn);
            dataIn <= v_dataIn;
            read(LINEA_ENTRADA, v_WD);
            WD <= v_WD;
            
            WAIT UNTIL RISING_EDGE(clk);	--ESPERO AL FLANCO DE SUBIDA 
    
            v_dataOut := dataOut;
            
            Hwrite(LINEA_SALIDA, v_add, right, 5);
            write(LINEA_SALIDA, v_WD, right, 5);
            Hwrite(LINEA_SALIDA, v_dataIn, right, 5);
            Hwrite(LINEA_SALIDA, v_dataOut, right, 5);
            
            writeline(ARCH_SALIDA, LINEA_SALIDA);-- escribe la linea en el archivo
            
        end loop;
        file_close(ARCH_ENTRADA);  -- cierra el archivo
        file_close(ARCH_SALIDA);  -- cierra el archivo
    
      wait;
    end process;
end Behavioral;

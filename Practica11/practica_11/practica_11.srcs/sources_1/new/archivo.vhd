library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity archivo_registro is
    Port ( readReg1, readReg2, writeReg, shamt : in STD_LOGIC_VECTOR (3 downto 0);
           writeData : in STD_LOGIC_VECTOR (15 downto 0);
           clk, clear, dir, SHE, WR : in STD_LOGIC;
           readData1, readData2 : out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture Behavioral of archivo_registro is
type arreglo is array (0 to 15) of STD_LOGIC_VECTOR (15 downto 0);
signal mem : arreglo;
begin
    process (clk, clear)
    begin
        if (clear = '1') then
            for i in 0 to 15 loop
                mem(i) <= "0000000000000000";
            end loop;
        elsif (rising_edge(clk)) then
            if (WR = '1') then
                if (SHE = '1') then
                    if (dir = '1') then
                        mem(conv_integer(writeReg)) <= to_stdlogicvector(to_bitvector(mem(conv_integer(readReg1))) sll (conv_integer(shamt)));
                    else
                        mem(conv_integer(writeReg)) <= to_stdlogicvector(to_bitvector(mem(conv_integer(readReg1))) srl (conv_integer(shamt)));
                    end if;
                else
                    mem(conv_integer(writeReg)) <= writeData;
                end if;
            else
                mem <= mem;
            end if;
        end if;
    end process;
    
    readData1 <= mem(conv_integer(readReg1));
    readData2 <= mem(conv_integer(readReg2));

end Behavioral;

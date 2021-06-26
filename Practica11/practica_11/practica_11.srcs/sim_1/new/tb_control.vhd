library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_control is
--  Port ( );
end tb_control;

architecture Behavioral of tb_control is
    component control is
        Port (
            CLK, CLR : in STD_LOGIC;
            EQ, NE, LT, LE, GT, GE, NA : in STD_LOGIC;
            TIPOR, BEQI, BNEI, BLTI, BLETI, BGTI, BGETI : in STD_LOGIC;
            SDOPC, SM : out STD_LOGIC
        );
    end component;

    signal clk, clr, EQ, NE, LT, LE, GT, GE, nivel, BGETI, BGTI, BLETI, BLTI, BNEQI, BEQI, TIPOR, SDOPC, SM : STD_LOGIC := '0';
    
begin
     uc : control Port map (
        clk => clk,
        clr => clr,
        EQ => EQ,
        NE => NE,
        LT => LT,
        LE => LE,
        GT => GT,
        GE => GE,
        na => nivel,
        BGETI => BGETI,
        BGTI => BGTI,
        BLETI => BLETI,
        BLTI => BLTI,
        BNEI => BNEQI,
        BEQI => BEQI,
        TIPOR => TIPOR,
        SDOPC => SDOPC,
        SM => SM
    );
    
    reloj : process begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    end process;
    
    process
    begin
        clr <= '1';
        wait until rising_edge(clk);
        
        clr <= '0';
        TIPOR <= '1';
        wait until rising_edge(clk);
        
        TIPOR <= '0';
        LT  <= '1';
        BLTI <= '1';
        wait until rising_edge(clk);
        
        LT <= '0';
        wait until rising_edge(clk);
        
        BLTI <= '0';
        LE <= '1';
        BLETI <= '1';
        wait until rising_edge(clk);
        
        LE <= '0';
        wait until rising_edge(clk);
        
        clr <= '1';
        wait;
    end process;
end Behavioral;

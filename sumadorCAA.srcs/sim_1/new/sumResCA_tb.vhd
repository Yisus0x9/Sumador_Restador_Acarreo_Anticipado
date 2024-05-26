-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 1.4.2024 19:31:17 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_sumRes4BCA is
end tb_sumRes4BCA;

architecture tb of tb_sumRes4BCA is

    component sumRes4BCA
        port (A    : in std_logic_vector (3 downto 0);
              B    : in std_logic_vector (3 downto 0);
              Co   : in std_logic;
              AInv : in std_logic;
              BInv : in std_logic;
              S    : out std_logic_vector (3 downto 0);
              C4   : out std_logic);
    end component;

    signal A    : std_logic_vector (3 downto 0);
    signal B    : std_logic_vector (3 downto 0);
    signal Co   : std_logic;
    signal AInv : std_logic;
    signal BInv : std_logic;
    signal S    : std_logic_vector (3 downto 0);
    signal C4   : std_logic;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : sumRes4BCA
    port map (A    => A,
              B    => B,
              Co   => Co,
              AInv => AInv,
              BInv => BInv,
              S    => S,
              C4   => C4);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    --  EDIT: Replace YOURCLOCKSIGNAL below by the name of your clock as I haven't guessed it
    --  YOURCLOCKSIGNAL <= TbClock;

    stimuli : process
    begin
    
        -- 8-8
        A <= "1000";
        B <= "1000";
        Co <= '1';
        BInv <= '0';
        AInv <= '1';
        wait for 10ns;
        
        -- 13-7
        A <= "1101";
        B <= "0111";
        Co <= '1';
        BInv <= '1';
        AInv <= '0';
        wait for 10ns;
        

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_sumRes4BCA of tb_sumRes4BCA is
    for tb
    end for;
end cfg_tb_sumRes4BCA;

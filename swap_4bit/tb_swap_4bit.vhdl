library ieee;
use ieee.std_logic_1164.all;

entity tb_swap_4bit is
end tb_swap_4bit;

architecture tb of tb_swap_4bit is
    component swap_4bit is
    port(
        x: in std_logic_vector(7 downto 0);
        y: out std_logic_vector(7 downto 0)
    );
    end component;

signal tb_x, tb_y: std_logic_vector(7 downto 0);

begin
    swap_4bit_module : swap_4bit port map(tb_x, tb_y);
    process
    begin
        tb_x <= "00001111";
        wait for 10 ns;

        tb_x <= "11000011";
        wait for 10 ns;
        
        tb_x <= "00100100";
        wait for 10 ns;
        wait;
    end process;
end tb;
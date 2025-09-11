library ieee;
use ieee.std_logic_1164.all;

entity tb_add_8bit is
end tb_add_8bit;

architecture tb of tb_add_8bit is
    component add_8bit is
    port(
        x: in std_logic_vector(7 downto 0);
        y: in std_logic_vector(7 downto 0);
        s: out std_logic_vector(7 downto 0);
        c: out std_logic
    );
    end component;

signal tb_x, tb_y, tb_s: std_logic_vector(7 downto 0);
signal tb_c: std_logic;

begin
    add_8bit_module : add_8bit port map(tb_x, tb_y, tb_s, tb_c);
    process
    begin
        tb_x <= "11111111";
        tb_y <= "11111111";
        wait for 10 ns;

        tb_x <= "00000000";
        tb_y <= "00000000";
        wait for 10 ns;

        tb_x <= "00111111";
        tb_y <= "00000001";
        wait for 10 ns;
        
        
        wait;
    end process;
end tb;
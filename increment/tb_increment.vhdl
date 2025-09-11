library ieee;
use ieee.std_logic_1164.all;

entity tb_increment is
end tb_increment;

architecture tb of tb_increment is
    component increment is
    port(
        x: in std_logic_vector(3 downto 0);
        s: out std_logic_vector(3 downto 0);
        c: out std_logic
    );
    end component;

signal tb_x, tb_s: std_logic_vector(3 downto 0);
signal tb_c: std_logic;

begin
    increment_module : increment port map(tb_x, tb_s, tb_c);
    process
    begin
        tb_x <= "1111";
        wait for 10 ns;

        tb_x <= "1110";
        wait for 10 ns;

        tb_x <= "0000";
        wait for 10 ns;
        

        wait;
    end process;
end tb;
library ieee;
use ieee.std_logic_1164.all;

entity tb_full_adder is
end tb_full_adder;

architecture tb of tb_full_adder is
    component full_adder is
    port(
        x,y,z:in std_logic;
        c,s: out std_logic
    );
end component; 

signal tb_x, tb_y, tb_z : std_logic;
signal tb_c, tb_s : std_logic;

begin
    full_adder_module : full_adder port map(tb_x, tb_y, tb_z, tb_c, tb_s);
    process
    begin
        tb_x <= '0';
        tb_y <= '0';
        tb_z <= '0';
        wait for 10 ns;

        tb_x <= '0';
        tb_y <= '0';
        tb_z <= '1';
        wait for 10 ns;

        tb_x <= '0';
        tb_y <= '1';
        tb_z <= '0';
        wait for 10 ns;

        tb_x <= '0';
        tb_y <= '1';
        tb_z <= '1';
        wait for 10 ns;

        tb_x <= '1';
        tb_y <= '0';
        tb_z <= '0';
        wait for 10 ns;

        tb_x <= '1';
        tb_y <= '0';
        tb_z <= '1';
        wait for 10 ns;

        tb_x <= '1';
        tb_y <= '1';
        tb_z <= '0';
        wait for 10 ns;

        tb_x <= '1';
        tb_y <= '1';
        tb_z <= '1';
        wait for 10 ns;

        wait;
    end process;
end tb;
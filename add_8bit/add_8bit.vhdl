library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add_8bit is
    port(
        x: in std_logic_vector(7 downto 0);
        y: in std_logic_vector(7 downto 0);
        s: out std_logic_vector(7 downto 0);
        c: out std_logic
    );
end add_8bit;

architecture rtl of add_8bit is
    signal temp_s: unsigned(8 downto 0);
begin
    temp_s <= '0' & unsigned(x) + unsigned(y);
    s <= std_logic_vector(temp_s(7 downto 0));
    c <= temp_s(8);
end rtl;
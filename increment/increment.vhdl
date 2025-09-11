library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity increment is
    port(
        x: in std_logic_vector(3 downto 0);
        s: out std_logic_vector(3 downto 0);
        c: out std_logic
    );
end increment;

architecture rtl of increment is
    signal temp_s: unsigned(4 downto 0);
begin
    temp_s <= '0' & unsigned(x) + 1;
    s <= std_logic_vector(temp_s(3 downto 0));
    c <= temp_s(4);
end rtl;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity swap_4bit is
    port(
        x: in std_logic_vector(7 downto 0);
        y: out std_logic_vector(7 downto 0)
    );
end swap_4bit;

architecture rtl of swap_4bit is
begin
    y<= x(3 downto 0) & x(7 downto 4);
end rtl;
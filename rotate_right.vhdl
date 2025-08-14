library ieee;
use ieee.std_logic_1164.all;

entity rotate_right is
    port(
        operand_1 : in std_logic_vector(7 downto 0);
        result : out std_logic_vector(7 downto 0)
    );
end rotate_right;
architecture rtl of rotate_right is
begin
    result <= operand_1(0) & operand_1(7 downto 1);
end rtl;
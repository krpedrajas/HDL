library ieee;
use ieee.std_logic_1164.all;

entity shift_left is
    port(
        operand_1 : in std_logic_vector(7 downto 0);
        result : out std_logic_vector(7 downto 0)
    );
end shift_left;
architecture rtl of shift_left is
begin
    result <= operand_1(6 downto 0) & '0';
end rtl;
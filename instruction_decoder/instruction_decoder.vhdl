library ieee;
use ieee.std_logic_1164.all;

entity instruction_decoder is
    port(
        instruction : in std_logic_vector(19 downto 0);
        opcode : out std_logic_vector(3 downto 0);
        operand_1, operand_2 : out std_logic_vector(7 downto 0)
    );
end instruction_decoder;

architecture rtl of instruction_decoder is  
begin
    opcode <= instruction(19 downto 16);
    operand_1 <= instruction(15 downto 8);
    operand_2 <= instruction(7 downto 0);
end rtl;
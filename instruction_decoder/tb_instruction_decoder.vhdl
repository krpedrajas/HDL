library ieee;
use ieee.std_logic_1164.all;

entity tb_instruction_decoder is
end tb_instruction_decoder;

architecture rtl of tb_instruction_decoder is
    component instruction_decoder is
    port(
        instruction : in std_logic_vector(19 downto 0);
        opcode : out std_logic_vector(3 downto 0);
        operand_1, operand_2 : out std_logic_vector(7 downto 0)
    );
end component;

    signal tb_instruction : std_logic_vector(19 downto 0);
    signal tb_opcode : std_logic_vector(3 downto 0);
    signal tb_operand_1 : std_logic_vector(7 downto 0);
    signal tb_operand_2 : std_logic_vector(7 downto 0);

begin
    instruction_decoder_module : instruction_decoder port map(tb_instruction, tb_opcode, tb_operand_1, tb_operand_2);
    process
    begin
        tb_instruction <= "00111111001110101011";
        wait for 10 ns;
        wait;
    end process;
end rtl;
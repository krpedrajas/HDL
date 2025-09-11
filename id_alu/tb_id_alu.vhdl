library ieee;
use ieee.std_logic_1164.all;

entity tb_id_alu is
end tb_id_alu;

architecture rtl of tb_id_alu is

    component instruction_decoder is
    port(
        instruction : in std_logic_vector(19 downto 0);
        opcode : out std_logic_vector(3 downto 0);
        operand_1, operand_2 : out std_logic_vector(7 downto 0)
    );
    end component;

    component alu is
        port(
            opcode : in std_logic_vector(3 downto 0);
            operand_1, operand_2 : in std_logic_vector(7 downto 0);
            result : out std_logic_vector(7 downto 0)
        );
    end component;

    signal tb_instruction : std_logic_vector(19 downto 0);
    signal tb_opcode : std_logic_vector(3 downto 0);
    signal tb_operand_1, tb_operand_2 : std_logic_vector(7 downto 0);
    signal tb_result : std_logic_vector(7 downto 0);

begin
    instruction_decoder_module : instruction_decoder port map (tb_instruction, tb_opcode, tb_operand_1, tb_operand_2);
    alu_module : alu port map (tb_opcode, tb_operand_1, tb_operand_2, tb_result);
    
    process
    begin
        tb_instruction <= "00000011101010111001";
        wait for 10 ns;

        tb_instruction <= "00010011101010111001";
        wait for 10 ns;

        tb_instruction <= "00100011101010111001";
        wait for 10 ns;

        tb_instruction <= "00110011101010111001";
        wait for 10 ns;

        tb_instruction <= "01000011101010111001";
        wait for 10 ns;

        tb_instruction <= "01010011101010111001";
        wait for 10 ns;

        tb_instruction <= "01100011101010111001";
        wait for 10 ns;

        tb_instruction <= "01110011101010111001";
        wait for 10 ns;


        
        wait;
    end process;

end rtl;
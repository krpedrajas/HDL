library ieee;
use ieee.std_logic_1164.all;

entity alu is
    port(
        opcode : in std_logic_vector(3 downto 0);
        operand_1, operand_2 : in std_logic_vector(7 downto 0);
        result : out std_logic_vector(7 downto 0)
    );
end alu;

architecture rtl of alu is

    --shift left, shift right, rotate left, rotate right
    component shift_left is
        port(
            operand_1 : in std_logic_vector(7 downto 0);
            result : out std_logic_vector(7 downto 0)
        );
    end component;
    component shift_right is
        port(
            operand_1 : in std_logic_vector(7 downto 0);
            result : out std_logic_vector(7 downto 0)
        );
    end component;
    component rotate_left is
        port(
            operand_1 : in std_logic_vector(7 downto 0);
            result : out std_logic_vector(7 downto 0)
        );
    end component;
    component rotate_right is
        port(
            operand_1 : in std_logic_vector(7 downto 0);
            result : out std_logic_vector(7 downto 0)
        );
    end component;

    --add_8bit, subtract_8bit, swap_4bit
    component add_8bit is
        port(
            x: in std_logic_vector(7 downto 0);
            y: in std_logic_vector(7 downto 0);
            s: out std_logic_vector(7 downto 0);
            c: out std_logic
        );
    end component;
    component subtract_8bit is
        port(
            x: in std_logic_vector(7 downto 0);
            y: in std_logic_vector(7 downto 0);
            s: out std_logic_vector(7 downto 0);
            c: out std_logic
        );
    end component;
    component swap_4bit is
        port(
            x: in std_logic_vector(7 downto 0);
            y: out std_logic_vector(7 downto 0)
        );
    end component;

    signal resultSL, resultSR, resultRL, resultRR : std_logic_vector(7 downto 0);
    signal sumADD, carryADD, sumSUB, carrySUB, resultSWAP : std_logic_vector(7 downto 0);
begin
    shift_left_module : shift_left port map(operand_1, resultSL);
    shift_right_module : shift_right port map(operand_1, resultSR);
    rotate_left_module : rotate_left port map(operand_1, resultRL);
    rotate_right_module : rotate_right port map(operand_1, resultRR);
    add_8bit_module : add_8bit port map(operand_1, operand_2, sumADD, carryADD);
    subtract_8bit_module : subtract_8bit port map(operand_1, operand_2, sumSUB, carrySUB);
    swap_4bit_module : swap_4bit port map(operand_1, resultSWAP);

    result <= 
        --and, or, not
        operand_1 and operand_2 when opcode = "0000" else
        operand_1 or operand_2 when opcode = "0001" else
        not(operand_1) when opcode = "0010" else
        not(operand_2) when opcode = "0011" else

        --shift and rotate
        resultSL when opcode = "0100" else
        resultSR when opcode = "0101" else
        resultRL when opcode = "0110" else
        resultRR when opcode = "0111" else

        --add, subtract, swap
        sumADD when opcode = "1000" else
        sumSUB when opcode = "1001" else
        resultSWAP when opcode = "1010" else
        (others => 'Z');
        
end rtl;

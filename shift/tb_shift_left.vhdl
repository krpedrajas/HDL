library ieee;
use ieee.std_logic_1164.all;

entity tb_shift_left is
end tb_shift_left;

architecture behavior of tb_shift_left is
    component shiftleft is
    port(
        operand_1 : in std_logic_vector(7 downto 0);
        result : out std_logic_vector(7 downto 0)
    );
end component;

    signal tb_operand_1 : std_logic_vector(7 downto 0);
    signal tb_result : std_logic_vector(7 downto 0);

begin
    shiftleft_module : shiftleft port map(tb_operand_1, tb_result);
    process
    begin
        tb_operand_1 <= "10000001";
        wait for 10 ns;

        tb_operand_1 <= "11000000";
        wait for 10 ns;

        tb_operand_1 <= "00000011";
        wait for 10 ns;

        wait;
    end process;
end behavior;
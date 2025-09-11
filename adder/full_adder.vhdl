library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(
        x,y,z:in std_logic;
        c,s: out std_logic
    );
end full_adder;

architecture rtl of full_adder is 
component half_adder is
    port(
        x,y:in std_logic;
        c,s: out std_logic
    );
end component; 

signal s1,c1,c2: std_logic;
begin
    half_adder_1: half_adder port map(x,y,c1,s1);
    half_adder_2: half_adder port map(s1,z,c2,s);
    c <= c1 or c2;
end rtl;
library ieee;
use ieee.std_logic_1164.all ;

entity SwitchdrivesLed is

port
(
	sw1 : in std_logic ;
	sw2 : in std_logic ;
	sw3 : in std_logic ;
	led1 : out std_logic;
	led2 : out std_logic;
	led3 : out std_logic


);
end entity;

architecture rtl of SwitchdrivesLed is

begin 

	led1 <= sw1 or sw2;
	led2 <= sw2 or sw3;
	led3 <= (sw1 or sw2) or sw3;


end rtl;

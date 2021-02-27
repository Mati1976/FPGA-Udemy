library ieee ;
use ieee.std_logic_1164.all;

entity StateMachine is 

port
(

	rst : in std_logic; --from the rsest button (asserted low)
	clk : in std_lOgic; -- 50 MHz
	sw  : in std_logic_vector (3 downto 1);
	led : out std_logic_vector (3 downto 1)

);



end entity;

architecture rtl of StateMachine is


component PLL IS
	PORT
	(
		areset		: IN STD_LOGIC  := '0';
		inclk0		: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC 
	);
END component;

type DatatTypeOfSMState is (State1 ,State2 ,State3);
signal StateVariable : DatatTypeOfSMState;
signal clk_25MHz		: std_logic;
 
begin
	
	PLL1:PLL 
	PORT map
	(
		areset	=>	not(rst),
		inclk0	=> clk, --50MHz
		c0			=> clk_25MHz --25MHz
	);


	process1 :process(rst, clk_25MHz)
	begin
		if rst='0' then
			StateVariable <= State1;
			led <= "111";--disables all LEDs
		
		elsif rising_edge(clk_25MHz) then
		
			case StateVariable is
				when State1 =>
					led <= "110";
					if sw(1) = '0'then
						StateVariable <= State2;
					end if; 
					
				when State2 =>
					led <= "101";
					if sw(2) = '0' then
						StateVariable <= State3;
					end if; 
					
				when State3 =>
					led <= "011";
					if sw(3) = '0' then
						StateVariable <= State1;
					end if; 
					
				when others =>
					StateVariable <= State1;
			
			end case;
			
		
		end if;
		
	
	
	end process;
	





end;


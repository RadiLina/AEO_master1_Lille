----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2019 10:58:29 AM
-- Design Name: 
-- Module Name: calc - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity calc is
    Port ( sw : in STD_LOGIC_VECTOR (15 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           btnL : in std_logic;
           btnR : in std_logic);
end calc;

architecture Behavioral of calc is
 component add4
    Port (  a : in STD_LOGIC_VECTOR (3 downto 0);
            b : in STD_LOGIC_VECTOR (3 downto 0);
            cin : in STD_LOGIC := '0';
            s : out STD_LOGIC_VECTOR (3 downto 0);
            cout : out std_logic
);
end component;


signal res : STD_LOGIC_VECTOR (3 downto 0);
signal resadd : STD_LOGIC_VECTOR (3 downto 0);
signal cout : STD_LOGIC;

component x7seg
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
       seg : out STD_LOGIC_VECTOR (6 downto 0);
       an : out STD_LOGIC_VECTOR (3 downto 0));
end component; 

begin
inst0 : add4 port map (a=>sw(3 downto 0),b=>sw(15 downto 12), cin=>'0',s=>resadd,cout=>cout);
inst1 : x7seg port map (sw=>res,seg=>seg,an=>an);

with std_logic_vector '(btnL&btnR) select 
      led(3 downto 0) <= resadd when "00",        
                        (sw(3 downto 0) and sw(15 downto 12)) when "01",
                        (sw(3 downto 0) or sw(15 downto 12)) when "10" ,
                        (sw(3 downto 0) xor sw(15 downto 12)) when "11" ;
                        
with std_logic_vector '(btnL&btnR) select 
       res <= resadd when "00",
            (sw(3 downto 0) and sw(15 downto 12)) when "01",
            (sw(3 downto 0) or sw(15 downto 12)) when "10" ,
            (sw(3 downto 0) xor sw(15 downto 12)) when "11" ;
                        
with std_logic_vector '(btnL&btnR) select 
                               led(4) <= cout when "00",
                                        '0' when others;
                        
      

end Behavioral;
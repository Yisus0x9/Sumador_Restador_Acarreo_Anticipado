------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 31.03.2024 13:28:14
---- Design Name: 
---- Module Name: sumRes4BCA - sumaRes4BCA
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sumRes4BCA is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Co : in STD_LOGIC;
           AInv : in STD_LOGIC;
           BInv : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C4 : out STD_LOGIC);
end sumRes4BCA;

architecture sumaRes4BCA of sumRes4BCA is
    signal EB,EA: std_logic_vector(0 to 3);
    signal P,G:std_logic_vector(0 to 3);
    signal Cc:std_logic_vector(0 to 4);
begin

    Cc(0)<=Co;
    ciclo: for i in 0 to 3 generate
            EA(i)<=A(i) xor AInv;
            EB(i)<=B(i) xor BInv;
            P(i)<=EA(i) xor EB(i);
            G(i)<=EA(i) and EB(i);
            Cc(i+1)<=(Cc(i) and P(i)) or G(i);
            S(i)<=EA(i) xor EB(i) xor Cc(i);    
    end generate;
             C4<=Cc(4);
end sumaRes4BCA;

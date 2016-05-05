-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT dsp48_test1
          PORT(
					CK : in std_logic;
					RST : in std_logic; -- Synchronous reset
					Ain, Bin : in std_logic_vector(17 downto 0); -- A and B inputs of the multiplier
					S : out std_logic_vector(47 downto 0) -- Accumulator output
          );
          END COMPONENT;

          SIGNAL CK :  std_logic := '0';
          SIGNAL RST :  std_logic := '1';
          SIGNAL Ain, Bin :  std_logic_vector(17 downto 0);
          SIGNAL S :  std_logic_vector(47 downto 0);
          
			constant PERIOD : time := 10ns;
  BEGIN
 		
  -- Component Instantiation
          uut: dsp48_test1 PORT MAP(
                  CK => CK,
                  RST => RST,
                  Ain => Ain,
                  Bin => Bin,
                  S => S
          );


  --  Test Bench Statements
  CK <= not CK after PERIOD/2;
  tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes

        -- Add user defined stimulus here
			RST <= '0';
			Ain <= "11" & x"FFFC";
			Bin <= "00" & x"0008";
        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;

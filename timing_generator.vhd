-------------------------------------------------------------------------------
--
-- Apple II/e Timing logic
--
-- György Szombathelyi
--
-- original Apple ][+ timing logic by:
-- Stephen A. Edwards, sedwards@cs.columbia.edu
--
-- Based on the book Understanding the Apple IIe by Jim Sather
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timing_generator is
  
  port (
    CLK_14M        : in  std_logic;           -- 14.31818 MHz master clock
    VID7M          : buffer std_logic := '0';
    Q3	           : buffer std_logic := '0'; -- 2 MHz signal in phase with PHI0
    RAS_N          : buffer std_logic := '0';
    CAS_N          : buffer std_logic := '0';
    AX             : buffer std_logic := '0';
    PHI0           : buffer std_logic := '0'; -- 1.0 MHz processor clock
    PRE_PHI0       : buffer std_logic := '0'; -- One 14M cycle before
    COLOR_REF      : buffer std_logic := '0'; -- 3.579545 MHz colorburst

    TEXT_MODE      : in std_logic;
    PAGE2          : in std_logic;
    HIRES_MODE     : in std_logic;
    MIXED_MODE     : in std_logic;
    COL80          : in std_logic;
    STORE80        : in std_logic;
    DHIRES_MODE    : in std_logic;

    VID7           : in std_logic;

    VIDEO_ADDRESS  : out unsigned(15 downto 0);
    SEGA        : buffer std_logic;
    SEGB        : buffer std_logic;
    SEGC        : buffer std_logic;
    GR1         : buffer std_logic;
    GR2         : buffer std_logic;
    HBL	 	    : buffer std_logic;      -- Horizontal blanking
    VBL         : buffer std_logic;      -- Vertical blanking
    BLANK          : out std_logic;      -- Composite blanking
    LDPS_N         : out std_logic
  );

end timing_generator;

architecture rtl of timing_generator is

  signal H : unsigned(6 downto 0) := "0000000";
  signal V : unsigned(8 downto 0) := "011111010";
  signal COLOR_DELAY_N : std_logic;

  signal CLK_7M: std_logic;
  signal RAS_N_PRE, AX_PRE, CAS_N_PRE, Q3_PRE, PHI0_PRE, VID7M_PRE, LDPS_N_PRE: std_logic;
  signal RASRISE1 : std_logic;
  signal H0, VA, VB, VC, V2, V4, GR2_G, GR3: std_logic;
  signal HIRES : std_logic;

begin
    PRE_PHI0 <= PHI0_PRE;
    RASRISE1 <= '1' when RAS_N = '1' and PHI0 = '0' and Q3 ='0' else '0';
    GR2_G <= GR2 and DHIRES_MODE;

    -- The main clock signal generator
    B1_74S175 : process (CLK_14M)
    begin
        if rising_edge(CLK_14M) then
            COLOR_REF <= CLK_7M xor COLOR_REF;
            CLK_7M <= not CLK_7M;
        end if;
    end process;

    -- The timing HAL equations
    RAS_N_PRE <= not (
            Q3
         or (not RAS_N and not AX)
         or (not RAS_N and COLOR_REF and H0 and PHI0)
         or (not RAS_N and not CLK_7M and H0 and PHI0));
    AX_PRE <= not (
            (not RAS_N and Q3)
         or (not AX and Q3));
    CAS_N_PRE <= not (
            (not AX)
         or (not AX and not PHI0)
         or (not CAS_N and not RAS_N));
    Q3_PRE <= not (
            (not AX and not PHI0 and not CLK_7M)
         or (not AX and PHI0 and CLK_7M)
         or (not Q3 and not RAS_N));
    PHI0_PRE <= not (
            (PHI0 and RAS_N and not Q3)
         or (not PHI0 and not RAS_N)
         or (not PHI0 and Q3));
    VID7M_PRE <= not (
            (GR2_G and SEGB)
         or (not GR2_G and COL80)
         or (not GR2_G and CLK_7M)
         or (not VID7 and not PHI0 and not Q3 and not AX)
         or (not H0 and COLOR_REF and not PHI0 and not Q3 and not AX)
         or (VID7M and AX)
         or (VID7M and PHI0)
         or (VID7M and Q3));
    LDPS_N_PRE <= not (
            (not Q3 and not AX and COL80 and not GR2_G)
         or (not Q3 and not AX and not PHI0 and not GR2_G)
         or (not Q3 and not AX and not PHI0 and not SEGB)
         or (not Q3 and not AX and not PHI0 and not VID7)
         or (not Q3 and not AX and not PHI0 and COLOR_REF and not H0)
         or (not Q3 and AX and not RAS_N and not PHI0 and VID7 and not SEGB and GR2_G));

    TIMING_HAL: process (CLK_14M)
    begin
        if rising_edge(CLK_14M) then
            RAS_N <= RAS_N_PRE;
            AX <= AX_PRE;
            CAS_N <= CAS_N_PRE;
            Q3 <= Q3_PRE;
            PHI0 <= PHI0_PRE;
            VID7M <= VID7M_PRE;
            LDPS_N <= LDPS_N_PRE;
        end if;
    end process;

    -- various auxilary signals
    process (CLK_14M)
    begin
        if rising_edge(CLK_14M) then
            if RASRISE1 = '1' then
                GR3 <= GR2;
                GR2 <= GR1;
                GR1 <= not (TEXT_MODE or (V2 and V4 and MIXED_MODE));
            end if;
        end if;
    end process;

    HIRES <= HIRES_MODE and GR3;

    process (CLK_14M)
    begin
        if rising_edge(CLK_14M) then
            if RASRISE1 = '1' then
                if GR1 = '0' then
                    SEGA <= VA;
                    SEGB <= VB;
                    SEGC <= VC;
                else
                    SEGA <= H0;
                    SEGB <= not HIRES_MODE;
                    SEGC <= VC;
                end if;
            end if;
        end if;
    end process;

    -- Horizontal and vertical counters
    HVCOUNTERS: process (CLK_14M)
    begin
        if rising_edge(CLK_14M) then
            if RASRISE1 = '1' then
                if H(6) = '0' then
                    H <= "1000000";
                else
                    H <= H + 1;
                    if H = "1111111" then
                        V <= V + 1;
                    end if;
                    if V = "111111111" then V <= "011111010"; end if;
                end if;
            end if;
        end if;
    end process;

    H0 <= H(0);
    VA <= V(0);
    VB <= V(1);
    VC <= V(2);
    V2 <= V(5);
    V4 <= V(7);

    HBL <= not (H(5) or (H(3) and H(4)));
    VBL <= V(6) and V(7);

    BLANK <= HBL or VBL;

  -- V_SYNC <= VBL and V(5) and not V(4) and not V(3) and
  --           not V(2) and (H(4) or H(3) or H(5));
  -- H_SYNC <= HBL and H(3) and not H(2);

  -- SYNC <= not (V_SYNC or H_SYNC);
  -- COLOR_BURST <= HBL and H(2) and H(3) and (COLOR_REF or TEXT_MODE);

  -- Video address calculation
  VIDEO_ADDRESS(2 downto 0) <= H(2 downto 0);
  VIDEO_ADDRESS(6 downto 3) <= (not H(5) &     V(6) & H(4) & H(3)) +
                               (    V(7) & not H(5) & V(7) &  '1') +
                               (                     "000" & V(6));
  VIDEO_ADDRESS(9 downto 7) <= V(5 downto 3);
  VIDEO_ADDRESS(14 downto 10) <=
    ("00" & HBL & (PAGE2 and not STORE80) & not (PAGE2 and not STORE80)) when HIRES = '0' else
    (             (PAGE2 and not STORE80) & not (PAGE2 and not STORE80) &  V(2 downto 0));

  VIDEO_ADDRESS(15) <= '0'; 

end rtl;

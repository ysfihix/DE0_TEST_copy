----------------------------------------------------------------------------------------------------
--  This code is generated by Terasic System Builder
--
--
-- Author : Hichem YOUSSFI
--
-- Date : 05/05/2017 20h00
--
-- Description : VIP#0 : Chroma resampler
--
----------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------
-- LIBRARY
----------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------------------------
entity VIP0 is
   port
   (
      clk                            : in    std_logic;
      reset_n                        : in    std_logic;
      enable                         : in    std_logic;
      --
      srce_valid                     : out   std_logic;
      srce_data                      : out   std_logic_vector(31 downto 0);
      srce_startofpacket             : out   std_logic;
      srce_endofpacket               : out   std_logic;
      srce_ready                     : in    std_logic;
      sink_valid                     : in    std_logic;
      sink_data                      : in    std_logic_vector(31 downto 0);
      sink_startofpacket             : in    std_logic;
      sink_endofpacket               : in    std_logic;
      sink_ready                     : out   std_logic
  );
end entity VIP0;


----------------------------------------------------------------------------------------------------
-- ARCHTITECTURE
----------------------------------------------------------------------------------------------------
architecture rtl of VIP0 is
----------------------------------------------------------------------------------------------------
-- CONSTANT
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- TYPE
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- COMPONENT
----------------------------------------------------------------------------------------------------

 ----------------------------------------------------------------------------------------------------
-- SIGNAL
----------------------------------------------------------------------------------------------------

begin

sink_ready          <= srce_ready;
srce_valid          <= sink_valid;
srce_data           <= sink_data;
srce_startofpacket  <= sink_startofpacket;
srce_endofpacket    <= sink_endofpacket;

end architecture rtl;
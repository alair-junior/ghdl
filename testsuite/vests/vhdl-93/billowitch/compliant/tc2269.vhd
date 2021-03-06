
-- Copyright (C) 2001 Bill Billowitch.

-- Some of the work to develop this test suite was done with Air Force
-- support.  The Air Force and Bill Billowitch assume no
-- responsibilities for this software.

-- This file is part of VESTs (Vhdl tESTs).

-- VESTs is free software; you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the
-- Free Software Foundation; either version 2 of the License, or (at
-- your option) any later version. 

-- VESTs is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-- for more details. 

-- You should have received a copy of the GNU General Public License
-- along with VESTs; if not, write to the Free Software Foundation,
-- Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 

-- ---------------------------------------------------------------------
--
-- $Id: tc2269.vhd,v 1.2 2001-10-26 16:29:46 paw Exp $
-- $Revision: 1.2 $
--
-- ---------------------------------------------------------------------

ENTITY c07s02b06x00p12n01i02269ent IS
END c07s02b06x00p12n01i02269ent;

ARCHITECTURE c07s02b06x00p12n01i02269arch OF c07s02b06x00p12n01i02269ent IS

BEGIN
  TESTING: PROCESS
    -- Local declarations.
    variable A, B    : INTEGER;
    variable OKtest  : INTEGER := 0;
  BEGIN
    -- Test integer mod operations.
    -- 1. Both positive.
    for A in 0 to 20 loop
      for B in 1 to 20 loop
        if NOT(((A - (A mod B)) rem B) = 0) then
          Oktest := 1;
        end if;
        assert (((A - (A mod B)) rem B) = 0)
          report "Mod operation has failed for integers.";
      end loop;
    end loop;
    
    -- 2. A negative, B positive.
    for A in -1 downto -20 loop
      for B in 1 to 20 loop
        if NOT(((A - (A mod B)) rem B) = 0) then
          Oktest := 1;
        end if;
        assert (((A - (A mod B)) rem B) = 0)
          report "Mod operation has failed for integers.";
      end loop;
    end loop;
    
    -- 3. A positive, B negative.
    for A in 0 to 20 loop
      for B in -1 downto -20 loop
        if NOT(((A - (A mod B)) rem B) = 0) then
          Oktest := 1;
        end if;
        assert (((A - (A mod B)) rem B) = 0)
          report "Mod operation has failed for integers.";
      end loop;
    end loop;
    
    -- 4. Both negative.
    for A in -1 downto -20 loop
      for B in -1 downto -20 loop
        if NOT(((A - (A mod B)) rem B) = 0) then
          Oktest := 1;
        end if;
        assert (((A - (A mod B)) rem B) = 0)
          report "Mod operation has failed for integers.";
      end loop;
    end loop;
    wait for 5 ns;
    assert NOT(OKtest=0)
      report "***PASSED TEST: c07s02b06x00p12n01i02269"
      severity NOTE;
    assert (OKtest=0)
      report "***FAILED TEST: c07s02b06x00p12n01i02269 - The result of the modulus operation satisfy the relation :A = B*N + (A mod B)."
      severity ERROR;
    wait;
  END PROCESS TESTING;

END c07s02b06x00p12n01i02269arch;

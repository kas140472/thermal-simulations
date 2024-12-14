# Load the PDB file
mol new output.pdb waitfor all

# Select all atoms
set all [atomselect top all]

# Read the occupancy values
set frame 0
set in [open "output.pdb" r]
set occ {}
while { [gets $in line] != -1 } {
    switch -- [string range $line 0 3] {
        END {
            $all frame $frame
            $all set user $occ
            set occ {}
            incr frame
        }
        ATOM - 
        HETA {
            # Extract occupancy (columns 55-60 in PDB format)
            lappend occ [string trim [string range $line 54 59]]
        }
    }
}
close $in

# Set coloring to 'user' and assign the range
mol modcolor 0 top User
mol modstyle 0 top VDW


### Instructions

To create the pdb file, 
1. Run `gcc -o thermal_md thermal_md.c`
2. Run `./thermal_md` which should create `output.pdb`

To load the pdb file into VMD,
1. Open VMD go to Extensions --> TK Console
2. Run `source /path/to/userb.tcl` to load the newly created output.pdb
3. In Graphics --> Represenations, choose Coloring Method = Beta and Drawing Method = VDW
4. Press play

# !/bin/bash

LIGNAME="3mt_e484a"

# New xtc
#gmx_mpi trjconv -f md_${LIGNAME}_200.xtc -s md_${LIGNAME}_200.tpr -n index.ndx -pbc nojump -center -ur compact -o new_xtc.xtc

#gmx_mpi make_ndx -f md_${LIGNAME}_200.gro -o ace_rbd.ndx

#gmx_mpi rms -f new_xtc.xtc -s md_${LIGNAME}_200.tpr -n ace_rbd.ndx -o rmsd.xvg -b 0 -e 200000 

gmx_mpi rmsf -f new_xtc.xtc -s md_${LIGNAME}_200.tpr -n ace_rbd.ndx -o rmsf_ace.xvg -oq .pdb -res -b 0 -e 200000 

gmx_mpi rmsf -f new_xtc.xtc -s md_${LIGNAME}_200.tpr -n ace_rbd.ndx -o rmsf_rbd.xvg -oq .pdb -res -b 0 -e 200000

gmx_mpi trjconv -f new_xtc.xtc -s md_${LIGNAME}_200.tpr -o Snap_.pdb -pbc mol -sep -ur compact -b 0 -e 200000 -dt 20000 

gmx_mpi cluster -f new_xtc.xtc -s md_${LIGNAME}_200.tpr -method gromos -cl cluster.pdb -g cluster.log -cutoff 0.25 -b 0 -e 200000 -dt 5000

gmx_mpi hbond -f new_xtc.xtc -s md_${LIGNAME}_200.tpr -n ace_rbd.ndx -num hbnum_protein_ligand.xvg

gmx_mpi gyrate -f new_xtc.xtc -s md_${LIGNAME}_200.tpr -b 0 -e 200000 -o gyration.xvg

#gmx_mpi rama -f new_xtc.xtc -s md_${LIGNAME}_200.tpr -o rama.xvg

gmx_mpi energy -f md_${LIGNAME}_200.edr -o energy.xvg

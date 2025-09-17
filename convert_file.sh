# !/bin/bash

LIGNAME="s477n_t478k_e484a"

cat rmsd.xvg > rmsd_${LIGNAME}.xvg
sed -i '/#\|@/d' rmsd_${LIGNAME}.xvg

#cat rmsf_ace.xvg > rmsf_ace_${LIGNAME}.xvg
#sed -i '/#\|@/d' rmsf_ace_${LIGNAME}.xvg

cat rmsf_rbd.xvg > rmsf_rbd_${LIGNAME}.xvg
sed -i '/#\|@/d' rmsf_rbd_${LIGNAME}.xvg

cat gyration.xvg > gy_${LIGNAME}.xvg
sed -i '/#\|@/d' gy_${LIGNAME}.xvg

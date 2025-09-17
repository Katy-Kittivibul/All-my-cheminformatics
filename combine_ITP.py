def read_itp(itp_name):
    lines = open(itp_name).readlines()
    impDat = []
    for n in  range(len(lines)): 
        if '[' in lines[n]: impDat.append(n)
    atom_def = lines[impDat[0]+1:impDat[1]] 
    rest_mol = lines[impDat[1]:]
    return(atom_def,rest_mol) 
a_NAD,r_NAD=read_itp('NAD.itp')
a_4I5,r_4I5=read_itp('4I5.itp')

atypes   = list(set(a_NAD + a_4I5)) 
moltypes = r_NAD + r_4I5
ofile=open('combo.itp','w')
ofile.write('[ atomtypes ] \n')
for line in atypes: ofile.write('%s'%line)
for line in moltypes: ofile.write('%s'%line)
ofile.close()
print('-maxwarn %d'%(len(a_NAD+a_4I5)))

timestamp=`date +%Y%m%d%H%M%S`

cd COSMIC/erc-training/
mkdir Logs
rm  Logs/*

#python -m pdb train_iemocap.py  --active-listener

python -m pdb train_meld.py --active-listener --class-weight --residual --classify sentiment 2>&1 |tee Logs/$timestamp.log  


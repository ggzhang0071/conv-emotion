timestamp=`date +%Y%m%d%H%M%S`

cd COSMIC/erc-training/
mkdir Logs
rm  Logs/*

python  MPSOGSA_GRU.py  2>&1 |tee Logs/$timestamp.log  


nohup python train_iemocap.py --active-listener   2>&1 |tee Logs/$timestamp.log  
timestamp=`date +%Y%m%d%H%M%S`

cd COSMIC/erc-training/
mkdir Logs
rm  Logs/*

nohup python MPSOGSA.py  2>&1 |tee Logs/$timestamp.log  


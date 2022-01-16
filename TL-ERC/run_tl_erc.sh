cd bert_model
mkdir Logs


for dataset in "iemocap"  
do 
    timestamp=`date +%Y%m%d%H%M%S`
    nohup python train.py --load_checkpoint=../generative_weights/cornell_weights.pkl --data=$dataset 2>&1 |tee Logs/run_$dataset.log
done
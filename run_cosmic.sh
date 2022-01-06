timestamp=`date +%Y%m%d%H%M%S`

cd COSMIC/erc-training/
mkdir Logs
rm  Logs/*

#python train_iemocap.py  --active-listener

python train_meld.py --active-listener --class-weight --residual --classify sentiment 2>&1 |tee Logs/$timestamp.log  


#python DialogueGCN/train_IEMOCAP.py  --base-model 'LSTM' --graph-model --nodal-attention --dropout 0.4 --lr 0.0003 --batch-size 32 --class-weight --l2 0.0 --no-cuda

#python train_meld.py --active-listener --attention simple --dropout 0.5 --rec_dropout 0.3 --lr 0.0001 --mode1 2 --classify emotion --mu 0 --l2 0.00003 --epochs 60


#python train_IEMOCAP.py --base-model 'LSTM' --graph-model --nodal-attention --dropout 0.4 --lr 0.0003 --batch-size 32 --class-weight --l2 0.0 --no-cuda

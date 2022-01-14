cd bert_model

for dataset in "dailydialog"  
do 
    python -m pdb train.py --load_checkpoint=../generative_weights/cornell_weights.pkl --data=iemocap
done
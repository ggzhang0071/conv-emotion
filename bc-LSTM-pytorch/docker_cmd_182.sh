img="nvcr.io/nvidia/pytorch:19.01-py3"
#nvcr.io/nvidia/pytorch:18.01-py3


docker run --gpus all  --privileged=true   --workdir /git --name "bclstm"  -e DISPLAY --ipc=host -d --rm  -p 6620:4452  \
-v /raid/git/conv-emotion/bc-LSTM-pytorch:/git/bc-LSTM-pytorch \
 -v  /raid/git/datasets:/git/datasets \
 $img sleep infinity


docker exec -it bclstm   /bin/bash


#pip install -r COSMIC/requirements.txt
#docker images |grep pytorch  | grep  "19"
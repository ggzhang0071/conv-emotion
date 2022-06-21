#docker_cmd_93.sh
img="nvcr.io/nvidia/pytorch:19.03-py3"
#nvcr.io/nvidia/pytorch:18.01-py3



docker run --gpus all   --privileged=true   --workdir /git --name "dialoguernn"  -e DISPLAY --ipc=host -d --rm  -p 6611:4452  \
-v /home/zgg/conv-emotion/DialogueRNN:/git/DialogueRNN \
 -v /home/zgg/datasets:/git/datasets \
 $img sleep infinity


docker exec -it dialoguernn /bin/bash

cd DialogueRNN

#pip install -r requirements.txt

#docker images |grep pytorch  | grep  "19"

#pip list  |grep "pytorch"

#docker stop dialoguernn

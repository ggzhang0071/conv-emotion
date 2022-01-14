#docker_cmd_93.sh
img="nvcr.io/nvidia/tensorflow:18.08-py3"
#nvcr.io/nvidia/pytorch:18.01-py3



docker run --gpus all  --privileged=true   --workdir /git --name "icon"  -e DISPLAY --ipc=host -d --rm  -p 6612:4452  \
-v /raid/git/conv-emotion:/git/conv-emotion \
 -v /raid/git/datasets:/git/datasets \
 $img sleep infinity


docker exec -it icon   /bin/bash

cd  conv-emotion

#docker images |grep tensorflow  | grep  "18"

#pip list  |grep "pytorch"

# pip install -r requirements.txt 

#docker stop icon
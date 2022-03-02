#docker_cmd_93.sh
img="nvcr.io/nvidia/pytorch:19.01-py3"
#nvcr.io/nvidia/pytorch:18.01-py3



docker run --gpus all  --privileged=true   --workdir /git --name "cosmic"  -e DISPLAY --ipc=host -d --rm  -p 6610:4452  \
-v /raid/git/conv-emotion/COSMIC/:/git/COSMIC \
 -v /raid/git/datasets:/git/datasets \
 $img sleep infinity


docker exec -it cosmic   /bin/bash

cd  conv-emotion

pip install -r COSMIC/requirements.txt
#docker images |grep pytorch  | grep  "19"

#pip list  |grep "pytorch"

#docker stop cosmic

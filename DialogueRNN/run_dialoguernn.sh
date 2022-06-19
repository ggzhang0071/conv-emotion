timestamp=$(date +%Y-%m-%d_%H-%M-%S)
mkdir Logs
python3  train_IEMOCAP.py   2>&1 | tee Logs/$timestamp.log

#python -c "import torch; print(torch.__version__)"

#python -c "import torch; print(torch.version.cuda)"

TORCH="1.0.0"
CUDA="10.0"

pip install torch-scatter -f https://data.pyg.org/whl/torch-${TORCH}+${CUDA}.html
pip install torch-sparse -f https://data.pyg.org/whl/torch-${TORCH}+${CUDA}.html
pip install torch-geometric
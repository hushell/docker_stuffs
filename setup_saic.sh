sudo apt-get -y update && sudo apt-get -y upgrade

# Install some basic utilities
sudo apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \

# Install Miniconda and Python 3.8
export CONDA_AUTO_UPDATE_CONDA=false
export PATH=/home/user/miniconda/bin:$PATH
curl -sLo ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-py38_4.8.2-Linux-x86_64.sh \
 && chmod +x ~/miniconda.sh \
 && ~/miniconda.sh -b -p ~/miniconda \
 && rm ~/miniconda.sh \
 && conda install -y python==3.8.1 \
 && conda clean -ya

~/miniconda/bin/conda init
source ~/.bashrc

# Install Pytorch 1.7 + CUDA 11.0
conda install -y pytorch torchvision torchaudio cudatoolkit=11.0 -c pytorch \
 && conda clean -ya

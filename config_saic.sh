# Ubuntu OS Requirements
sudo apt-get -y update && sudo apt-get -y upgrade

# Install some basic utilities
sudo apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
 && sudo rm -rf /var/lib/apt/lists/*

# Install Miniconda and Python 3.8
curl -sLo ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-py38_4.8.2-Linux-x86_64.sh \
 && chmod +x ~/miniconda.sh \
 && ~/miniconda.sh -b 

source /home/user/miniconda3/etc/profile.d/conda.sh
conda activate base
conda init

# Install Pytorch + CUDA 11.1
conda install -y python==3.8.1 
conda install pytorch torchvision torchaudio cudatoolkit=11.1 -c pytorch -c conda-forge
conda clean -ya

# System packages
sudo apt-get update && sudo apt-get install -y \
	vim screen htop wget gcc libsndfile1 g++
sudo apt-get install -y git-core bash-completion unzip

# Python packages
pip install soundfile tqdm jupyter jupyterlab matplotlib 
pip install numpy Cython dotmap gym h5py gym_minigrid blosc opencv-python
pip install -r requirements.txt

# bashrc
#echo "export PATH=/home/user/miniconda3/bin:$PATH" >> ~/.bash_profile
echo "source ~/.bashrc" >> ~/.bash_profile
echo "export CONDA_AUTO_UPDATE_CONDA=false" >> ~/.bash_profile
echo "alias screen='screen -U'" >> ~/.bash_profile
echo "defshell -bash" > ~/.screenrc
echo "source /usr/share/bash-completion/completions/git" >> ~/.bash_profile
source ~/.bash_profile
cp gitconfig ~/.gitconfig

# bugfix
pip install --upgrade 'jedi<0.18.0'

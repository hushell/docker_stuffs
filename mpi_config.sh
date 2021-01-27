export CONDA_AUTO_UPDATE_CONDA=false
export PATH=/home/user/miniconda/bin:$PATH
curl -sLo ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-py38_4.8.2-Linux-x86_64.sh 
chmod +x ~/miniconda.sh
cd ~
bash ~/miniconda.sh -b -p ~/miniconda
cd -

conda install -y python==3.7.4
conda clean -ya

# Install Pytorch 1.7 + CUDA 11.0
conda install -y pytorch==1.2.0 torchvision==0.4.0 cudatoolkit=10.0 -c pytorch
conda clean -ya

# Python packages
sudo apt-get update && sudo apt-get install -y \
	vim screen htop wget gcc libsndfile1 g++
sudo apt-get install -y git-core bash-completion unzip

pip install soundfile tqdm jupyter jupyterlab matplotlib 
pip install numpy Cython
pip install -r requirements.txt

# bashrc
~/miniconda/bin/conda init
echo "alias screen='screen -U'" >> ~/.bashrc
echo "defshell -bash" > ~/.screenrc
echo "source /usr/share/bash-completion/completions/git" >> ~/.bashrc
source ~/.bashrc
cp gitconfig ~/.gitconfig

# bugfix
pip install --upgrade 'jedi<0.18.0'

source ~/.bashrc

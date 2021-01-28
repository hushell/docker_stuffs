sudo apt-get update && sudo apt-get install -y \
	vim screen htop wget gcc libsndfile1 g++
sudo apt-get install -y git-core bash-completion unzip

# Python packages
pip install soundfile tqdm jupyter jupyterlab matplotlib 
pip install numpy Cython dotmap
pip install -r requirements.txt

git clone https://github.com/pytorch/fairseq
cd fairseq
pip install --editable ./
cd ..

# bashrc
~/miniconda/bin/conda init
echo "alias screen='screen -U'" >> ~/.bashrc
echo "defshell -bash" > ~/.screenrc
echo "source /usr/share/bash-completion/completions/git" >> ~/.bashrc
source ~/.bashrc
cp gitconfig ~/.gitconfig

# asteroid
#cd /app/hushell/UploadAI/asteroid-avatar
#pip install -e .


# mnt
cd /mnt
sudo mkdir scratch07
cd scratch07
sudo ln -s /app/hushell hushell


# bugfix
pip install --upgrade 'jedi<0.18.0'

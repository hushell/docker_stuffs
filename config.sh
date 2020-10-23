sudo apt-get update && sudo apt-get install -y \
	vim screen htop wget gcc libsndfile1
sudo apt-get install -y git-core bash-completion

# Python packages
pip install torchaudio==0.5.0 soundfile tqdm jupyter jupyterlab matplotlib 
pip install numpy Cython
pip install -r requirements.txt

# bashrc
~/miniconda/bin/conda init
echo "alias screen='screen -U'" >> ~/.bashrc
echo "defshell -bash" > ~/.screenrc
echo "source /usr/share/bash-completion/completions/git" >> ~/.bashrc
source ~/.bashrc
cp gitconfig ~/.gitconfig

# asteroid
cd /app/hushell/UploadAI/asteroid-avatar
pip install -e .


# mnt
cd /mnt
sudo mkdir scratch07
cd scratch07
sudo ln -s /app/hushell hushell

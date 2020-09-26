apt-get update && apt-get install -y \
	vim screen htop wget gcc

# Python packages
pip install torchaudio==0.5.0 soundfile tqdm jupyter matplotlib 
pip install numpy Cython
pip install -r requirements.txt

# bashrc
~/miniconda/bin/conda init
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv git-completion.bash ~/.git-completion.bash
cp gitconfig ~/.gitconfig
echo "source ~/.git-completion.bash" >> ~/.bashrc
echo "defshell -bash" > ~/.screenrc

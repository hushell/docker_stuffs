# Python packages
pip install torchaudio==0.5.0 soundfile tqdm jupyter matplotlib 

# bashrc
~/miniconda3/bin/conda init
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv git-completion.bash ~/.git-completion.bash
cp gitconfig ~/.gitconfig
echo "source ~/.git-completion.bash" >> ~/.bashrc
echo "defshell -bash" > ~/.screenrc

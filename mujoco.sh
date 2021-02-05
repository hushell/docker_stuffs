sudo apt-get update && sudo apt-get install -y \
	vim screen htop wget gcc libsndfile1 g++
sudo apt-get install -y git-core bash-completion unzip
sudo apt-get install -y \
    libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev libglew1.5 libglew-dev \
    curl \
    git \
    libgl1-mesa-dev \
    libgl1-mesa-glx \
    libglew-dev \
    libosmesa6-dev \
    software-properties-common \
    net-tools \
    unzip \
    vim \
    virtualenv \
    wget \
    xpra \
    xserver-xorg-dev
sudo apt-get install patchelf
sudo apt-get install libgl1-mesa-dev libgl1-mesa-glx libosmesa6-dev
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*


mkdir -p ~/.mujoco
cp -R /app/hushell/rl_dir/mujoco_dir/mujoco200 ~/.mujoco/
cp -R /app/hushell/rl_dir/mujoco_dir/mjkey.txt ~/.mujoco/

echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.mujoco/mujoco200/bin" >> ~/.bashrc

cd ~/.mujoco
git clone https://github.com/openai/mujoco-py.git
cd mujoco-py/


pip install tqdm jupyter jupyterlab matplotlib 
pip install numpy Cython dotmap gym
pip install --no-cache-dir -r requirements.txt
pip install --no-cache-dir -r requirements.dev.txt

python setup.py install

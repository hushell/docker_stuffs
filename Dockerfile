FROM nvidia/cuda:11.0-runtime-ubuntu20.04

LABEL maintainer="hushell"

# Ubuntu OS Requirements
RUN apt-get -y update && apt-get -y upgrade

# Install some basic utilities
RUN apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
 && rm -rf /var/lib/apt/lists/*

# Create a working directory
RUN mkdir /app
WORKDIR /app

# Create a non-root user and switch to it
RUN adduser --disabled-password --gecos '' --shell /bin/bash user \
 && chown -R user:user /app
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER user

# All users can use /home/user as their home directory
ENV HOME=/home/user
RUN chmod 777 /home/user

# Install Miniconda and Python 3.8
ENV CONDA_AUTO_UPDATE_CONDA=false
ENV PATH=/home/user/miniconda/bin:$PATH
RUN curl -sLo ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-py38_4.8.2-Linux-x86_64.sh \
 && chmod +x ~/miniconda.sh \
 && ~/miniconda.sh -b -p ~/miniconda \
 && rm ~/miniconda.sh \
 && conda install -y python==3.8.1 \
 && conda clean -ya

# Install Pytorch 1.7 + CUDA 11.0
RUN conda install -y pytorch torchvision torchaudio cudatoolkit=11.0 -c pytorch \
 && conda clean -ya

#####################################################################
# Project specific
RUN sudo apt-get update && sudo apt-get install -y \
	vim screen htop wget gcc libsndfile1 g++ \
 && sudo apt-get install -y git-core bash-completion

# Python packages
RUN pip install soundfile tqdm jupyter jupyterlab matplotlib \
 && pip install numpy Cython \
 && pip install PyYAML>=5.0 \
                numpy>=1.16.4 \
                pandas>=0.23.4 \
                scipy>=1.1.0 \
                pytorch-lightning==0.9.0 # not compatible with 1.0 \
                pb_bss_eval>=0.0.2 \
                torch_stoi>=0.0.1 \
                torch_optimizer>=0.0.1a12 \
                SoundFile>=0.10.2 \
                pre-commit \
                black==19.10b0 \
                librosa>=0.8.0 \
                pyloudnorm \
                seaborn

# bashrc
RUN ~/miniconda/bin/conda init \
 && echo "alias screen='screen -U'" >> ~/.bashrc \
 && echo "defshell -bash" > ~/.screenrc \
 && echo "source /usr/share/bash-completion/completions/git" >> ~/.bashrc \
 && source ~/.bashrc \
 && cp gitconfig ~/.gitconfig \

#####################################################################

# Set the default command to python3
CMD ["python3"]

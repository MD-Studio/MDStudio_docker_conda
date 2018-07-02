FROM conda/miniconda2

RUN apt-get update -y && apt-get install git -y

# Service user
RUN useradd mdstudio && mkdir /home/mdstudio && chown mdstudio:mdstudio /home/mdstudio

COPY . /home/mdstudio

WORKDIR /home/mdstudio

RUN conda install -c anaconda twisted==17.9.0

RUN git clone --branch devel --single-branch git://github.com/MD-Studio/MDStudio.git

RUN  pip install -e MDStudio/mdstudio

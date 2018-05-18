FROM conda/miniconda2

RUN apt-get update -y && apt-get install git -y

# Service user
RUN useradd mdstudio && mkdir /home/mdstudio && chown mdstudio:mdstudio /home/mdstudio

COPY . /home/mdstudio

WORKDIR /home/mdstudio

RUN conda install -c anaconda twisted 

RUN git clone git://github.com/MD-Studio/MDStudio.git --branch v1 --single-branch

RUN  pip install -e MDStudio/mdstudio

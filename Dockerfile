FROM conda/miniconda3

RUN apt-get update -y && apt-get install git -y

# Service user
RUN useradd mdstudio && mkdir /home/mdstudio && chown mdstudio:mdstudio /home/mdstudio

COPY . /home/mdstudio

WORKDIR /home/mdstudio

RUN git clone --branch master --single-branch git://github.com/MD-Studio/MDStudio.git

# Update conda and install fixed twisted version of MDStudio
RUN conda update conda && \
    conda install python=3.6 && \
    conda install -c anaconda twisted==18.4.0

# Install MDStudio library
RUN  cd MDStudio && pip install -e mdstudio

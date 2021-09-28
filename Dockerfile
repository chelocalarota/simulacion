FROM    python:3.7-buster
USER    root
COPY    requirements.txt /tmp/
RUN adduser simulacion \
        --disabled-password \
        --gecos ""
RUN apt-get update && \
    apt-get install -y sudo
RUN adduser simulacion sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /home/simulacion
RUN pip install --upgrade pip
RUN sudo apt-get update && apt-get install -y libgl1-mesa-dev
RUN pip install -r /tmp/requirements.txt
EXPOSE  8888
#RUN jupyter notebook --allow-root --generate-config

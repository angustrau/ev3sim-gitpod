FROM gitpod/workspace-full-vnc

RUN pyenv install 3.9.7 \
    && pyenv global 3.9.7
RUN pip3 install wheel ev3sim==2.2.2

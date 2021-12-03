FROM gitpod/workspace-full-vnc

RUN sudo apt-get update \
    && sudo apt-get install python3.9 \
    && pyenv global 3.9.5
RUN pip3 install wheel ev3sim==2.2.2

# Disable SDL audio
ENV SDL_AUDIODRIVER=disk
ENV SDL_DISKAUDIOFILE=/dev/null

FROM gitpod/workspace-full-vnc

ARG EV3SIM_VERSION=2.2.2
ARG PYTHON_VERSION=3.9.7

RUN pyenv install ${PYTHON_VERSION} \
    && pyenv global ${PYTHON_VERSION} \
    && pip3 install wheel

RUN git clone --branch "v${EV3SIM_VERSION}" "https://github.com/MelbourneHighSchoolRobotics/ev3sim.git" /ev3sim \
    && pip install -e /ev3sim

COPY .user_config.yaml /ev3sim/user_config.yaml

# Disable SDL audio
ENV SDL_AUDIODRIVER=disk
ENV SDL_DISKAUDIOFILE=/dev/null

# Set X server resolution
ENV CUSTOM_XVFB_WxHxD=960x720x16

FROM gitpod/workspace-full-vnc

ARG EV3SIM_VERSION=2.2.2
ARG PYTHON_VERSION=3.9.7

RUN pyenv install ${PYTHON_VERSION} \
    && pyenv global ${PYTHON_VERSION} \
    && pip3 install wheel

RUN git clone --branch "v${EV3SIM_VERSION}" "https://github.com/MelbourneHighSchoolRobotics/ev3sim.git" /home/gitpod/ev3sim
COPY --chown=gitpod .user_config.yaml /home/gitpod/ev3sim/user_config.yaml
RUN pip install -e /home/gitpod/ev3sim

# Disable SDL audio
ENV SDL_AUDIODRIVER=disk
ENV SDL_DISKAUDIOFILE=/dev/null

# Set X server resolution
ENV CUSTOM_XVFB_WxHxD=960x720x16

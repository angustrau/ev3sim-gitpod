FROM gitpod/workspace-full-vnc

ARG EV3SIM_VERSION=2.2.2
ARG PYTHON_VERSION=3.9.7

RUN pyenv install ${PYTHON_VERSION} \
    && pyenv global ${PYTHON_VERSION} \
    && pip3 install wheel

RUN git clone --branch "v${EV3SIM_VERSION}" "https://github.com/MelbourneHighSchoolRobotics/ev3sim.git" /home/gitpod/ev3sim
RUN sed -i -e 's/xdg-open/code/g' /home/gitpod/ev3sim/ev3sim/utils.py \
    && ln -s /workspace/ev3sim-gitpod/.user_config.yaml /home/gitpod/ev3sim/ev3sim/user_config.yaml \
    && pip3 install -e /home/gitpod/ev3sim

# Disable SDL audio
ENV SDL_AUDIODRIVER=disk
ENV SDL_DISKAUDIOFILE=/dev/null

# Set window settings
ENV CUSTOM_XVFB_WxHxD=960x720x16
RUN sudo sed -i '/<applications>/a <application type="normal"><decor>no</decor><maximized>true</maximized></application>' /etc/xdg/openbox/rc.xml

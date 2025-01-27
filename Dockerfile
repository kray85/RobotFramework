FROM selenium/standalone-chrome:131.0
LABEL authors="TetraDigitalGuy Kendal"

USER root
RUN apt-get update && \
    apt-get install -y wget build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev git && \
    wget https://www.python.org/ftp/python/3.9.7/Python-3.9.7.tgz && \
    tar xzf Python-3.9.7.tgz && \
    cd Python-3.9.7 && \
    ./configure --enable-optimizations && \
    make altinstall && \
    ln -sf /usr/local/bin/python3.9 /usr/bin/python3 && \
    ln -sf /usr/local/bin/pip3.9 /usr/bin/pip3 && \
    cd .. && \
    rm -rf Python-3.9.7 Python-3.9.7.tgz

COPY requirements.txt ./
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

ENV PATH="/opt/venv/bin:$PATH"

# Create the directory and set permissions
RUN mkdir -p /robot_selenium-tests && chmod -R 777 /robot_selenium-tests


USER seluser
RUN google-chrome --headless --remote-debugging-port=9222 &

ENTRYPOINT ["bash", "-c"]
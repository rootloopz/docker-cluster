FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y \
    openmpi-bin \
    libopenmpi-dev \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

RUN pip install mpi4py

# Generate SSH keys
RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -N '' && \
    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

RUN echo "StrictHostKeyChecking no" >> /root/.ssh/config

WORKDIR /app

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]


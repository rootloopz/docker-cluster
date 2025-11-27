FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y \
    openmpi-bin \
    libopenmpi-dev \
    openssh-server \
    default-jre

RUN pip install mpi4py pyspark

# Generate SSH keys
RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -N '' && \
    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

RUN echo "StrictHostKeyChecking no" >> /root/.ssh/config

WORKDIR /app

COPY run_spark.sh /run_spark.sh
RUN chmod +x /run_spark.sh

EXPOSE 22 7077 8080

CMD /run_spark.sh && /usr/sbin/sshd -D


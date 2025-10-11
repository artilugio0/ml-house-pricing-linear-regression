FROM python:3.13-bookworm

RUN apt-get update
RUN apt-get upgrade -y

RUN useradd -u 1000 user -b /home -m
RUN mkdir /app
RUN chown user /app

USER user
WORKDIR /home/user

RUN python -m venv venv
RUN bash -c "source /home/user/venv/bin/activate && pip install jupyter matplotlib numpy pandas scikit-learn"

WORKDIR /app

CMD ["bash", "-c", "source /home/user/venv/bin/activate && jupyter notebook --ip=0.0.0.0 --no-browser"]

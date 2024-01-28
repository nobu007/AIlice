FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3 python3-pip

WORKDIR /scripter


RUN pip3 install pyzmq

# python env for ailice
WORKDIR /scripter
RUN pip3 install comet_llm google-generativeai momento langchain_google_genai langchain

# main script for ailice
COPY setup.py /scripter/setup.py
COPY ailice /scripter/ailice
COPY README.md /scripter/README.md
RUN pip3 install .

EXPOSE 59000-59200

# sub scripts for ailice
COPY README.md /scripter/README.md
COPY scripts /scripter/scripts
COPY .env /scripter/.env

# ececute once for donwloading model
ARG MOMENTO_AUTH_TOKEN GOOGLE_API_KEY
ENV MOMENTO_AUTH_TOKEN=${MOMENTO_AUTH_TOKEN}
ENV GOOGLE_API_KEY=${GOOGLE_API_KEY}
RUN bash /scripter/scripts/run_ailice_once.sh

CMD ["python3", "-m", "ailice.modules.AScripter", "--incontainer", "--addr=tcp://0.0.0.0:59000"]
# CMD ["/scripter/scripts/run_ailice_web.sh"]
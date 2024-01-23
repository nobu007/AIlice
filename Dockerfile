FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3 python3-pip

WORKDIR /scripter

COPY ailice /scripter/ailice
COPY setup.py /scripter/setup.py
COPY README.md /scripter/README.md

RUN pip3 install pyzmq

# python env for ailice
WORKDIR /scripter
RUN pip3 install .
RUN pip3 install comet_llm google-generativeai momento langchain_google_genai langchain python-dotenv

EXPOSE 59000-59200
# RUN bash /scripter/scripts/run_ailice_web_once.sh

CMD ["python3", "-m", "ailice.modules.AScripter", "--incontainer", "--addr=tcp://0.0.0.0:59000"]

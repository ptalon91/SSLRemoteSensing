FROM nvcr.io/nvidia/pytorch:22.05-py3

ENTRYPOINT ["tail", "-f", "/dev/null"]

ENV DEBIAN_FRONTEND=noninteractive 
ENV PATH="${PATH}:/opt/hpcx/ompi/bin"
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/opt/hpcx/ompi/lib"

RUN apt-get update
RUN apt -y install python3-opencv
RUN apt-get install -y libboost-all-dev

COPY ./requirements.txt ./

RUN pip install -r ./requirements.txt
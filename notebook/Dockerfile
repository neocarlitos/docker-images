FROM python:2-slim

RUN apt-get update
RUN apt-get install -y gcc

RUN pip install jupyter ipywidgets matplotlib pandas requests
RUN jupyter nbextension enable --py widgetsnbextension

RUN mkdir /notebooks
ADD *.ipynb /notebooks/

WORKDIR /notebooks

CMD jupyter notebook --port=8888 --ip=0.0.0.0 --allow-root --NotebookApp.token=''

FROM jupyter/datascience-notebook
# FROM minidocks/graphviz
  
RUN pip install papermill[all] 
RUN pip install jupyter jupyterhub ethercalc-python
RUN pip install networkx==2.5.1
RUN pip install datalad
# RUN pip install graphillion graphviz
# RUN pip install pygraphviz



ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

# RUN adduser --disabled-password \
#    --gecos "Default user" \
#    --uid ${NB_UID} \
#    ${NB_USER}

COPY . ${HOME}
USER root
RUN apt-get update; apt-get install git-annex datalad -y
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

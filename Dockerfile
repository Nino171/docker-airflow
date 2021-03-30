FROM puckel/docker-airflow

USER root

RUN set -xe \
  && pip install papermill flake8 \
	  'apache-airflow[kubernetes]' \
	  awscli \
	  sql_magic \
  && python3 -m ipykernel install

COPY requirements.txt ./

# install python libraries and jupyterlab extensions
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt 

RUN chown -R airflow:airflow /usr/local/airflow

USER airflow

# Airflow needs a home. `~/airflow` is the default, but you can put it
# somewhere else if you prefer (optional)
source .venv/bin/activate
mkdir -p ~/airflow
export AIRFLOW_HOME=~/airflow
.venv/bin/python3 -m pip install --upgrade pip
# Install Airflow using the constraints file
AIRFLOW_VERSION=2.5.0
PYTHON_VERSION="$(python --version | cut -d " " -f 2 | cut -d "." -f 1-2)"
# For example: 3.7
CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"
# For example: https://raw.githubusercontent.com/apache/airflow/constraints-2.5.0/constraints-3.7.txt
AIRFLOW_EXTRAS="async,celery,dask,ldap,pandas,password,rabbitmq,sentry,virtualenv,postgres,redis,ssh,http,ftp,sftp" # extra API python package for airflow

# all extras package are in 5 part :
# - Core Airflow extras
# - Providers extras
# - Apache Software extras
# - External Services extras
# - Locally installed software extras
# - Other extras
# - Bundle extras
# - Doc extras

# For example : pip install 'apache-airflow[pandas]' install airflow-pandas package for airflow project
pip install "apache-airflow[${AIRFLOW_EXTRAS}]==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"

# The Standalone command will initialise the database, make a user,
# and start all components for you.
# > airflow standalone

# You can also start airflow with python -m airflow

# Visit localhost:8080 in the browser and use the admin account details
# shown on the terminal to login.
# Enable the example_bash_operator dag in the home page

#You can inspect the file either in $AIRFLOW_HOME/airflow.cfg,
#or through the UI in the Admin->Configuration menu.
#The PID file for the webserver will be stored in $AIRFLOW_HOME/airflow-webserver.pid
#or in /run/airflow/webserver.pid if started by systemd.

## MORE INFO
# configuration : https://airflow.apache.org/docs/apache-airflow/stable/configurations-ref.html#celery
# production deployment : https://airflow.apache.org/docs/apache-airflow/stable/production-deployment.html
# instalation : https://airflow.apache.org/docs/apache-airflow/stable/installation/index.html
# pypi instalation : https://airflow.apache.org/docs/apache-airflow/stable/installation/installing-from-pypi.html
# airflow-extras : https://airflow.apache.org/docs/apache-airflow/stable/extra-packages-ref.html

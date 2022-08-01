source ${PWD}/venv/bin/activate

mkdir -p ${PWD}/dags/

export AIRFLOW_HOME=~/airflow
export AIRFLOW__CORE__DAGS_FOLDER="${PWD}/dags"
export PYTHONPATH=${PWD}
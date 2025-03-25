echo '!!! Starting e-commerce ELT Process !!!'

echo '!!! Starting data download and data cleaning'
python main.py

echo '!!! Starting dbt transformation and validation process'
cd dbt_ecomm

echo '!!! Running dbt seed'
dbt seed --target raw

echo '!!! Running dbt run'
dbt run

#echo 'Running dbt test'
#dbt test

echo '!!! ELT Process COMPLETED !!!'

# Module 2 Final Project: E-commerce Data Analysis with dbt

This project is part of the Module 2 Final Project for the NTU Data Science and AI program. The goal of this project is to analyze and transform e-commerce data using dbt (Data Build Tool) to derive meaningful insights.

## Project Structure


## Data Sources

The project uses the following datasets located in the `data/` folder:
- `olist_customers_dataset.csv`
- `olist_geolocation_dataset.csv`
- `olist_order_items_dataset.csv`
- `olist_order_payments_dataset.csv`
- `olist_order_reviews_dataset.csv`
- `olist_orders_dataset.csv`

## Key Features

1. **Data Cleansing**: Scripts and notebooks for cleaning raw data.
2. **Data Transformation**: dbt models for transforming raw data into analytics-ready tables.
3. **Analysis**: Insights derived from the transformed data.

## Setup Instructions

1. Clone the repository:
   ```sh
   git clone <repository-url>
   cd module2-project

2. Set up the environment:
   ```sh
    conda env create -f environment.yml
    conda activate module2-project

3. Add API keys: Place your API keys in the .keys/ folder (e.g., kaggle.json).

4. Run dbt commands:
   ```sh
    cd dbt_ecomm
    dbt run
    dbt test


## Resources
    Learn more about dbt in the docs
    Check out Discourse for commonly asked questions and answers
    Join the chat on Slack for live discussions and support
    Find dbt events near you
    Check out the blog for the latest news on dbt's development and best practices

# Standard library imports
import logging

# Third-party imports
import pandas as pd
import yaml

# Local application/library specific imports
from src.kaggle_download import load_kaggle_dataset
from src.clean_olist_customer import clean_customers_files
from src.clean_olist_order_items import clean_order_items
from src.clean_olist_orders import clean_orders_file
from src.clean_olist_orders import clean_order_payments_file
from src.clean_olist_products_dataset import clean_products_dataset

logging.basicConfig(level=logging.INFO)

def main():

    logging.info("Starting main.py")

    # Configuration file path
    logging.info("Loading Configurations")
    config_path = "./src/config.yaml"

    with open(config_path, "r") as file:
        config = yaml.safe_load(file)

    # Load configurations
    source_folder = config["source_folder"]
    seed_destination = config["seed_folder_path"]

    # Load Data Source from Kaggle
    logging.info("Loading data from Kaggle")
    load_kaggle_dataset(config["kaggle_source"])


    # Initialize and run data preparation
    logging.info("Data Cleaning")
    
    # Cleaning customers file
    customers_file_name = config['customers_file']
    cleaned_customers_file_name = config['cleaned_customers_file'] 
    clean_customers_files(source_folder, customers_file_name, seed_destination, cleaned_customers_file_name)
    
    # Cleaning order items file
    order_items_file_name = config['order_items_file']
    cleaned_order_items_file_name = config['cleaned_order_items_file']
    clean_order_items(source_folder, order_items_file_name, seed_destination, cleaned_order_items_file_name)
    
    # Clean orders file
    orders_dataset_file_name = config['orders_dataset_file']
    cleaned_orders_dataset_file_name = config['cleaned_orders_dataset_file']
    clean_orders_file(source_folder, orders_dataset_file_name, seed_destination, cleaned_orders_dataset_file_name)

    # Clean order payments file
    order_payments_file_name = config['order_payments_file']
    cleaned_order_payments_file_name = config['cleaned_order_payments_file']
    clean_order_payments_file(source_folder, order_payments_file_name, seed_destination, cleaned_order_payments_file_name)

    # Clean products file
    products_file_name = config['products_file']
    cleaned_products_file_name = config['cleaned_products_file']
    clean_products_dataset(source_folder, products_file_name, seed_destination, cleaned_products_file_name)

    logging.info("End of Python script.")
    logging.info("End of data download and data cleaning")


if __name__ == "__main__":
    main()

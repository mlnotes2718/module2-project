# Standard library imports
import logging

# Third-party imports
import pandas as pd
import yaml

# Local application/library specific imports
from src.kaggle_download import load_kaggle_dataset
from src.clean_olist_customer import clean_customers_files
from src.clean_olist_products_dataset import clean_products_dataset

logging.basicConfig(level=logging.INFO)


#@ignore_warnings(category=Warning)
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
    clean_customers_files(source_folder, seed_destination)
    clean_products_dataset(source_folder, seed_destination)

    logging.info("End of Python script.")


if __name__ == "__main__":
    main()

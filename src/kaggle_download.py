import os

def load_kaggle_dataset(source_name):
    
    # Set the directory where kaggle.json is stored
    os.environ["KAGGLE_CONFIG_DIR"] = os.path.abspath("./.keys")

    # Import Kaggle AFTER setting environment variables
    from kaggle.api.kaggle_api_extended import KaggleApi

    # Manually authenticate
    api = KaggleApi()
    api.authenticate()  # Should work now

    # Download dataset
    api.dataset_download_files(source_name, path="./data", unzip=True)
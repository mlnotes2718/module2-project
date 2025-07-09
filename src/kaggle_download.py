import os

def load_kaggle_dataset(source_name):
    import os
    import json
    
    # Create .kaggle directory
    kaggle_dir = os.path.expanduser("~/.kaggle")
    os.makedirs(kaggle_dir, exist_ok=True)
    
    # Create kaggle.json from environment variables
    kaggle_config = {
        "username": os.environ.get("KAGGLE_USERNAME"),
        "key": os.environ.get("KAGGLE_KEY")
    }
    
    with open(os.path.join(kaggle_dir, "kaggle.json"), "w") as f:
        json.dump(kaggle_config, f)
    
    # Set proper permissions
    os.chmod(os.path.join(kaggle_dir, "kaggle.json"), 0o600)
    
    # Import and use Kaggle API
    from kaggle.api.kaggle_api_extended import KaggleApi
    
    api = KaggleApi()
    api.authenticate()
    
    # Download dataset
    api.dataset_download_files(source_name, path="./data", unzip=True)
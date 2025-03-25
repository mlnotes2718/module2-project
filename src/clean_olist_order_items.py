import pandas as pd
import os

def clean_order_items(source_folder, seed_folder):

    # Setting source and cleaned file name
    source_file_name = 'olist_order_items_dataset.csv'
    cleaned_file_name = 'clean_olist_order_items.csv'

    # Setting source folder and path
    current_path = os.getcwd()
    order_items_file = os.path.join(current_path, source_folder, source_file_name)
    
    # load csv file
    order_item_df = pd.read_csv(order_items_file)

    # Data cleaning
    order_item_no_duplicate = order_item_df.drop_duplicates(subset =['order_id'], keep='last')

     # Setting seed path
    seed_path = os.path.join(current_path, seed_folder, cleaned_file_name)

    # Save file to seeds folder
    order_item_no_duplicate.to_csv(seed_path, index = False)
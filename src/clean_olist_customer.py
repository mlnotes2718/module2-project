import pandas as pd
import os

def clean_customers_files(source_folder, seed_folder):
    
    # Setting source and cleaned file name
    source_file_name = 'olist_customers_dataset.csv'
    cleaned_file_name = 'clean_olist_customers.csv'

    # Setting source folder and path
    current_path = os.getcwd()
    customers_file = os.path.join(current_path, source_folder, source_file_name)
    
    # load csv file
    customer = pd.read_csv(customers_file)

    # Data cleaning
    duplicates = customer[customer.duplicated(subset =['customer_unique_id'], keep = False)]
    duplicated_customer_id = customer[customer.duplicated(subset = ['customer_id'], keep= False)]
    customer_no_duplicates = customer.drop_duplicates(subset =('customer_unique_id'), keep='first')
    
    # Setting seed path
    seed_path = os.path.join(current_path, seed_folder, cleaned_file_name)

    # Save file to seeds folder
    customer_no_duplicates.to_csv(seed_path, index = False)
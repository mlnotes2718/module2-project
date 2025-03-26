import pandas as pd
import logging
import os

logging.basicConfig(level=logging.INFO)

def clean_orders_file(source_folder, source_file_name, seed_folder, cleaned_file_name):

    logging.info("Cleaning Orders File")

    # Setting source and cleaned file name
    # source_file_name = 'olist_orders_dataset.csv'
    # cleaned_file_name = 'cleaned_orders.csv'
    
    # Setting source path
    current_path = os.getcwd()
    orders_file = os.path.join(current_path, source_folder, source_file_name)

    # Read source 
    orders_df = pd.read_csv(orders_file)

    # Data Cleaning
    date_columns = [
    "order_purchase_timestamp", "order_approved_at",
    "order_delivered_carrier_date", "order_delivered_customer_date",
    "order_estimated_delivery_date"
    ]
    orders_df[date_columns] = orders_df[date_columns].apply(pd.to_datetime)

    orders_df_cleaned = orders_df[~(
        (orders_df["order_status"] == "delivered") &
        (orders_df["order_delivered_customer_date"].isnull())
    )].copy()


    orders_df_cleaned["order_approved_at"] = orders_df_cleaned["order_approved_at"].fillna(
        orders_df_cleaned["order_purchase_timestamp"]
    )

    orders_df_cleaned = orders_df_cleaned.drop_duplicates()

    # Setting seed path
    seed_path = os.path.join(current_path, seed_folder, cleaned_file_name)

    # Save to seed folder
    orders_df_cleaned.to_csv(seed_path, index=False)

    logging.info("Orders File Cleaned and Saved to Seeds")

def clean_order_payments_file(source_folder, source_file_name, seed_folder, cleaned_file_name):

    logging.info("Cleaning Order Payments File")

    # Setting source and cleaned file name
    # source_file_name = 'olist_order_payments_dataset.csv'
    # cleaned_file_name = 'cleaned_order_payments.csv'
    
    # Setting source path
    current_path = os.getcwd()
    payments_file = os.path.join(current_path, source_folder, source_file_name)

    # Read source 
    payments_df = pd.read_csv(payments_file)

    payments_df.drop_duplicates(inplace=True)


    # Setting seed path
    seed_path = os.path.join(current_path, seed_folder, cleaned_file_name)

    # Save to seed folder
    payments_df.to_csv(seed_path, index=False)

    logging.info("Order Payments File Cleaned and Saved to Seeds")




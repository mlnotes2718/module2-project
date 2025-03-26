import pandas as pd

# Load datasets
payments_df = pd.read_csv("/home/esther/Project/Final_Project/Data/olist_order_payments_dataset.csv")
orders_df = pd.read_csv("/home/esther/Project/Final_Project/Data/olist_orders_dataset.csv")

# Remove duplicates from payments_df
payments_df.drop_duplicates(inplace=True)

# Convert relevant columns to datetime
date_columns = [
    "order_purchase_timestamp", "order_approved_at",
    "order_delivered_carrier_date", "order_delivered_customer_date",
    "order_estimated_delivery_date"
]
orders_df[date_columns] = orders_df[date_columns].apply(pd.to_datetime)

# Filter out rows with delivered status but missing delivery date
orders_df_cleaned = orders_df[~(
    (orders_df["order_status"] == "delivered") &
    (orders_df["order_delivered_customer_date"].isnull())
)].copy()  # <-- Make a copy to avoid SettingWithCopyWarning

# Fill missing approved_at dates with purchase_timestamp
orders_df_cleaned["order_approved_at"] = orders_df_cleaned["order_approved_at"].fillna(
    orders_df_cleaned["order_purchase_timestamp"]
)

# Drop duplicate rows
# Safely drop duplicates (without inplace)
orders_df_cleaned = orders_df_cleaned.drop_duplicates()

# Optional: Drop any rows with remaining NaNs (if needed)
# Comment this out if not desired
# orders_df_cleaned = orders_df_cleaned.dropna()

# Save cleaned data
payments_df.to_csv("/home/esther/Project/Final_Project/Data/cleaned_order_payments.csv", index=False)
orders_df_cleaned.to_csv("/home/esther/Project/Final_Project/Data/cleaned_orders.csv", index=False)

print("- cleaned_order_payments.csv")
print("- cleaned_orders.csv")



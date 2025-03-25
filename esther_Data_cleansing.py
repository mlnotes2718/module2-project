import pandas as pd

payments_df = pd.read_csv("/home/esther/Project/Final_Project/Data/olist_order_payments_dataset.csv")
orders_df = pd.read_csv("/home/esther/Project/Final_Project/Data/olist_orders_dataset.csv")

payments_df.drop_duplicates(inplace=True)

date_columns = [
    "order_purchase_timestamp", "order_approved_at",
    "order_delivered_carrier_date", "order_delivered_customer_date",
    "order_estimated_delivery_date"
]
orders_df[date_columns] = orders_df[date_columns].apply(pd.to_datetime)

orders_df_cleaned = orders_df[~(
    (orders_df["order_status"] == "delivered") &
    (orders_df["order_delivered_customer_date"].isnull())
)]

orders_df_cleaned["order_approved_at"].fillna(
    orders_df_cleaned["order_purchase_timestamp"], inplace=True
)

orders_df_cleaned.drop_duplicates(inplace=True)
orders_df_cleaned = orders_df.dropna()

payments_df.to_csv("/home/esther/Project/Final_Project/Data/cleaned_order_payments.csv", index=False)
orders_df_cleaned.to_csv("/home/esther/Project/Final_Project/Data/cleaned_orders.csv", index=False)

print("- cleaned_order_payments.csv")
print("- cleaned_orders.csv")


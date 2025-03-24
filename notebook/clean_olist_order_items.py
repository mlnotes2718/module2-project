import pandas as pd
order_item_df= pd.read_csv('mmodule2-project/dataset/olist_customers_dataset.csv')
order_item_no_duplicate = order_item_df.drop_duplicates(subset =['order_id'], keep='last')
order_item_no_duplicate.to_csv('clean_olist_order_items.csv', index = False)
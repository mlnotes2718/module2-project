import pandas as pd
customer = pd.read_csv('module2-project/dataset/olist_customers_dataset.csv')
duplicates = customer[customer.duplicated(subset =['customer_unique_id'], keep = False)]
duplicated_customer_id = customer[customer.duplicated(subset = ['customer_id'], keep= False)]
customer_no_duplicates = customer.drop_duplicates(subset =('customer_unique_id'), keep='first')
customer_no_duplicates.to_csv('clean_olist_customers.csv', index = False)
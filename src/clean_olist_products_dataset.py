import pandas as pd
import os

def clean_products_dataset(source_folder, seed_folder):

    # Setting source and cleaned file name
    source_file_name = 'olist_products_dataset.csv'
    cleaned_file_name = 'clean_olist_products.csv'
    
    # Setting source path
    current_path = os.getcwd()
    products_file = os.path.join(current_path, source_folder, source_file_name)
    products_df = pd.read_csv(products_file)

    # dropping these columns (product_name_lenght, product_description_lenght and product_photos_qty) as they aren't needed for analysis
    # original product names will be replaced with the translated version so the lengths would be different anyway
    products_df = products_df.drop(['product_name_lenght', 'product_description_lenght', 'product_photos_qty'], axis=1)

    # drop all rows with any null values
    products_df = products_df.dropna()

    # read 'product_category_name_translation.csv'
    name_file = os.path.join(current_path, 'dataset', 'product_category_name_translation.csv')
    name_df = pd.read_csv(name_file)

    # merge both dataframes so that the correct translated names are on the same rows as the product_category_name
    df_merged = products_df.merge(name_df, on='product_category_name', how='left')

    # fix the rows where 'product_category_name_english' is null and 'product_category_name' is 'pc_gamer'
    df_merged.loc[df_merged['product_category_name']=='pc_gamer', 'product_category_name_english'] = 'pc_gamer'

    # fix the remaining rows where 'product_category_name_english' is null and 'product_category_name' is 'portateis_cozinha_e_preparadores_de_alimentos'
    df_merged.fillna(value='portable_kitchen_and_food_preparators', inplace=True)

    # replace 'product_category_name" with its english counterpart
    df_merged['product_category_name'] = df_merged['product_category_name_english']

    # drop 'product_category_name_english' as it's now redundant
    df_merged = df_merged.drop('product_category_name_english', axis=1)

    # set product_id as the index
    df_merged.set_index('product_id', inplace=True)

    # Setting seed path
    seed_path = os.path.join(current_path, seed_folder,cleaned_file_name)

    # Save to seed folder
    df_merged.to_csv(seed_path, index=True)

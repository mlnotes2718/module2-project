# dbt_ecomm: E-commerce Data Transformation Project

The `dbt_ecomm` project is designed to transform raw e-commerce data into analytics-ready tables using dbt (Data Build Tool). This project leverages BigQuery as the data warehouse and follows best practices for ELT (Extract, Load, Transform) workflows.

## Project Overview

This project includes:
- **Staging Models**: Clean and prepare raw data for downstream transformations.
- **Dimensional Models**: Create analytics-ready tables such as `dim_customers` and `dim_products`.
- **Fact Models**: Aggregate transactional data for reporting and analysis.
- **Testing**: Ensure data quality using dbt's built-in testing framework and additional packages.




## Setup Instructions

1. **Install dbt**:
   Ensure you have dbt installed. You can install it via pip:
   ```sh
   pip install dbt-bigquery

2. Set Up BigQuery Credentials: Place your BigQuery service account key file in the .keys/ directory (e.g., sctp-data-eng-ecomm-5e533c859ea1.json).

3. Configure Profiles: Update the profiles.yml file with your BigQuery project details. The project supports three environments:

prod: Production dataset (ecomm)
dev: Development dataset (ecomm_dev)
raw: Raw dataset (ecomm_raw)

4. Run dbt Commands:
    Compile and execute models:
    ```sh
        dbt run
    
    Test data quality:
    ```sh
        dbt test

    Generate documentation:
    ```sh
        dbt docs generate
        dbt docs serve

## Key Features
    Materializations:
    Staging models are materialized as tables.
    Dimensional and fact models are materialized as views or tables, depending on configuration.
   
    Packages: The project uses the following dbt packages:
    dbt_utils: Utility macros for dbt.
    dbt_expectations: Data testing macros.
    dbt_date: Date-related transformations.
    Data Warehouse: The project uses Google BigQuery as the data warehouse.

    Resources:
    Learn more about dbt in the docs
    Explore dbt packages on dbt Hub
    Join the dbt community on Slack
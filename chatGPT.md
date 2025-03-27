**# ELT Technical Report**

## **1. Introduction**

This document provides a technical overview of the Extract, Load, and Transform (ELT) process implemented for processing the **Kaggle Olist Dataset**. The pipeline is designed to automate data ingestion, cleaning, transformation, and storage using **BigQuery** as the primary data warehouse. Execution is automated through **GitHub Workflow**, with **GitHub Runner** handling the execution process.

## **2. Data Source**

The ELT process uses the **Kaggle Olist Dataset**, which contains Brazilian e-commerce transaction data, including orders, customers, products, payments, and seller information.

### **2.1 Data Ingestion Process**

The ingestion process follows these steps:

- **Configuration Load**: The `config.yaml` file specifies data paths.
- **Dataset Download**: The script `load_kaggle_dataset()` fetches the dataset from Kaggle.
- **Storage**: The raw data is stored locally before further processing.

**Python Code Reference (main.py):**

```python
# Load Data Source from Kaggle
logging.info("Loading data from Kaggle")
load_kaggle_dataset(config["kaggle_source"])
```

## **3. Infrastructure Overview**

Our ELT pipeline is designed to efficiently process and store data using **Google BigQuery** for scalable storage and **GitHub Runner** for execution.

### **3.1 Storage: Google BigQuery**

- **BigQuery** serves as the primary data warehouse for storing processed datasets.
- After transformation, the data is loaded into BigQuery for analytical queries.
- The data is structured efficiently for optimized querying and reporting.

### **3.2 Execution: GitHub Runner**

- The ELT pipeline is executed using **GitHub Runner**, which automates the workflow on a cloud-hosted Ubuntu machine.
- GitHub Actions orchestrate the pipeline execution, logging, and error handling.
- The runner ensures the reproducibility of the ELT process across different environments.

## **4. ELT Process Overview**

The ELT pipeline is composed of the following key steps:

### **4.1 Extract (E) - Data Download & Cleaning**

The following shell script (`run.sh`) initiates the process:

```bash
echo '!!! Starting e-commerce ELT Process !!!'

# Run main.py for data extraction and cleaning
python main.py
```

The Python script (`main.py`) performs:

- **Loading configurations**
- **Downloading data from Kaggle**
- **Cleaning multiple datasets** (customers, orders, products, payments, etc.)
- **Generating cleaned datasets for dbt processing**

### **4.2 Load (L) - Database Preparation**

Before transformation, the database environment is set up using dbt:

```bash
cd dbt_ecomm
dbt clean  # Cleaning dbt environment
dbt deps   # Checking dependencies
dbt seed --target raw  # Loading initial data
```

- The `dbt seed` command loads reference data into the database.
- The `dbt deps` command ensures that all dependencies are installed before transformation.

### **4.3 Transform (T) - Data Processing with dbt**

Once the data is ingested, transformation is carried out using dbt:

```bash
dbt run   # Running transformations
dbt test  # Running tests to validate data integrity
dbt clean  # Final cleanup
```

- The `dbt run` command applies transformation logic to raw data tables.
- The `dbt test` command ensures data integrity by checking constraints and relationships.
- The final cleanup removes temporary files and ensures a clean working environment.

## **5. GitHub Workflow for Automation**

### **5.1 Overview**

The ELT process is automated using **GitHub Actions**, which triggers the pipeline on a schedule or via manual execution.

### **5.2 Workflow Trigger Mechanism**

- **Manual Trigger**: Developers can manually start the workflow via GitHub UI.
- **Scheduled Execution**: Runs daily at **3:00 PM UTC (11:00 PM Singapore Time)** using a `cron` schedule.
- **GitHub Runner** is responsible for executing the scheduled jobs.

### **5.3 Workflow Execution Steps**

```yaml
name: Run ELT Process on Schedule

on:
  workflow_dispatch:  # Enables manual triggering from GitHub UI
  schedule:
    - cron: '0 15 * * *'  # Runs every day at 3pm UTC 11pm SG time

jobs:
  run-script:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Code
        uses: actions/checkout@v4
      
      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.10'
      
      - name: Install Dependencies
        run: |
          python -m pip install --upgrade pip
          if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

      - name: Run Script and Capture Logs
        run: ./run.sh 2>&1 | tee workflow.log
      
      - name: Read Log File into Environment Variable
        run: echo "LOG_CONTENT<<EOF" >> $GITHUB_ENV && cat workflow.log >> $GITHUB_ENV && echo "EOF" >> $GITHUB_ENV
      
      - name: Send Email Notification with Logs
        if: always()
        uses: dawidd6/action-send-mail@v3
        with:
          server_address: smtp.gmail.com
          server_port: 587
          username: ${{ secrets.MAIL_USERNAME }}
          password: ${{ secrets.MAIL_PASSWORD }}
          subject: "GitHub Actions Workflow Run - ${{ job.status }}"
          body: |
            Job Status: ${{ job.status }}
            
            Logs:
            ${{ env.LOG_CONTENT }}
            
            Check full logs here: ${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}
          to: ${{ secrets.COLLABORATORS_EMAILS }}
          from: "GitHub Actions <no-reply@example.com>"
```

### **5.4 Error Handling & Notifications**

- The workflow captures **logs** and stores them in `workflow.log`.
- An **email notification** is sent upon completion, indicating success or failure.
- A link to GitHub Actions logs is included for debugging.

## **6. Conclusion**

This ELT pipeline efficiently extracts, cleans, and transforms data from the **Kaggle Olist Dataset**, storing it in **BigQuery**. **GitHub Runner** ensures automation, while **dbt** handles transformations. The integration of **GitHub Workflow** provides scheduling, execution, and monitoring capabilities for a robust data pipeline.

This report ensures transparency in implementation, allowing future enhancements and scalability.


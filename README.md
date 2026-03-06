# AWS Data Warehouse Pipeline: Amazon Redshift & S3

## Project Overview
This project is a Proof of Concept (POC) demonstrating a highly performant, secure, and automated data warehouse architecture on AWS. Designed to support data science workloads, the pipeline ingests a large, multi-table dataset (music ticket sales) from an Amazon S3 data lake into an Amazon Redshift cluster. 

By leveraging native AWS capabilities, this architecture emphasizes the **principle of least privilege**, **network isolation**, and **least operational overhead**.

---

## Architecture

<img width="542" height="364" alt="image" src="https://github.com/user-attachments/assets/e3bc5002-7edd-4c75-b97e-0407734613ac" />


---

## Native AWS Services & Features Showcased

### 1. Storage & Compute
* **Amazon Redshift:** Provisioned a multi-node cluster utilizing columnar data storage. This natively optimizes query performance for analytical workloads and significantly reduces storage costs compared to traditional relational databases.
* **Amazon S3:** Served as the scalable, durable staging environment for raw text datasets (pipe and tab-delimited files).

### 2. Security & Access Management
* **AWS IAM (Identity and Access Management):** * Implemented IAM Roles (`MyRedshiftRole`) attached directly to the Redshift cluster, granting it secure, read-only access to S3 without managing long-term credentials.
  * Configured granular IAM Policies (`Policy-For-Data-Scientists`) to strictly limit user access to only the necessary API actions.
* **Amazon VPC & Security Groups:** Deployed the cluster within a Virtual Private Cloud (VPC) and configured an inbound Security Group rule to restrict access exclusively to port 5439 (Redshift's default port), establishing strict network isolation.

### 3. Programmatic Access & Automation
* **Redshift Data API & AWS CLI:** Demonstrated asynchronous, programmatic database access via the AWS Cloud9 IDE. 
> **Architectural Decision:** Using the Redshift Data API eliminates the operational overhead of configuring database drivers (JDBC/ODBC) and managing persistent connection pools, returning query results in a clean JSON format for downstream application processing.

---

## Technical Implementation

The repository contains the code used to provision and test the data warehouse:

* **`01_create_tables.sql`:** Defines the database schema (`users`, `date`, `sales`). Demonstrates performance tuning by applying Redshift-specific `distkey` (Distribution Key) and `sortkey` (Sort Key) constraints.
* **`02_load_data.sql`:** Executes the Redshift `COPY` command. This is the most efficient, native method for bulk-loading data from S3, dynamically parsing delimiters (`\t`, `|`) and time formats directly during ingestion.
* **`03_analytics_queries.sql`:** Contains complex SQL joins and aggregations used to validate the data and extract business intelligence (e.g., calculating top buyers by quantity).
* **`04_redshift_data_api.sh`:** A bash script utilizing the AWS CLI to execute `execute-statement` and `get-statement-result` commands, proving that restricted users can query the database securely via the API.

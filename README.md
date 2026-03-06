# Storing and Analyzing Data by Using Amazon Redshift

![Project Architecture](architecture.png)

## Overview
This project is a Proof of Concept (POC) demonstrating how to build a highly performant and secure data warehouse pipeline on AWS. The objective is to efficiently ingest, store, and query large datasets, specifically a multi-table music ticket sales dataset. 

Unlike traditional relational database management systems, Amazon Redshift uses columnar data storage, which significantly improves query performance and reduces overall storage costs.

## Architecture & AWS Capabilities Showcased
This project highlights the integration of several native AWS services, optimized for least operational overhead and stringent security:

* **Amazon Redshift:** Deployed a multi-node cluster to handle large-scale analytics. Leveraged the SQL `COPY` command to rapidly ingest data directly from S3, applying specific delimiters and time formats for seamless schema matching.
* **Amazon S3:** Acted as the secure, scalable staging area for the raw text files.
* **AWS IAM:** Configured distinct IAM Roles and Policies to govern cross-service communication securely:
  * Attached an IAM Role (`MyRedshiftRole`) to the cluster, granting it read-only access to S3 without embedding long-term credentials.
  * Applied granular IAM policies (`Policy-For-Data-Scientists`) to IAM groups, restricting user access specifically to the Redshift Data API.
* **Amazon VPC & Security Groups:** Locked down the Redshift cluster within a VPC, utilizing a dedicated Security Group to only allow inbound traffic on port 5439.
* **AWS CLI & Redshift Data API:** Demonstrated programmatic, API-driven database querying directly from an AWS Cloud9 IDE. This approach retrieves JSON-formatted responses for downstream application integration without the operational overhead of managing persistent database connections.

## Key Objectives Achieved
1. **Schema Definition:** Successfully provisioned database schemas (`dev` database) and optimized tables (`users`, `date`, `sales`) using distribution and sort keys.
2. **Secure Data Loading:** Transferred data from an external S3 bucket into Redshift using role-based access.
3. **Data Analytics:** Executed complex aggregations and joins to derive business intelligence, such as identifying top buyers by quantity.
4. **Programmatic Access:** Validated that restricted users could interact with the warehouse securely via the `execute-statement` and `get-statement-result` CLI commands.
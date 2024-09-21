q1) Provide a SQL query that will answer this question: a. In 2021, which 10 states had the highest number of children enrolled in Pre-K?

Please refer the sql: https://github.com/Rameshganesan/bezos/blob/main/enrollment/sql/query.sql

a. Please list all tools and technologies you used to complete this assignment. 

AWS Lambda: A serverless computing service used to import data from the API through Python.
Amazon S3: Object storage service utilized for storing the retrieved data.
Amazon EventBridge: Employed to schedule Lambda functions by setting triggers.
Amazon Athena: A serverless query service used for running queries on the stored data.

b. Explain your rationale for your approach to this task. 

The primary goal of my approach was to complete the task using minimal resources and avoid the overhead of managing and configuring servers. Therefore, a serverless solution was the optimal choice. By leveraging serverless tools from AWS, I was able to minimize both effort and complexity.

My approach was focused on quickly retrieving data from the API endpoint and running the necessary queries for reporting. The process followed these key steps:

Data Retrieval: I used AWS Lambda to execute Python code that fetched data from the API endpoint.
Data Organization: The results were written in a structured manner, with data for each year stored in separate folders. This allowed me to create a partitioned table in AWS Athena, enabling more efficient querying by avoiding full table scans.
Automation: To ensure the process runs regularly, I used Amazon EventBridge to schedule the job to execute daily at 8 am UTC.
This serverless approach allowed for streamlined execution and improved performance without the need for manual server management.

c. What else would you do if you had more time?

I would have done below stuff to improvise the code if I would have got time.

Enhanced Exception Handling: I would improve exception handling in the Python code to make it more robust, and integrate Amazon CloudWatch to trigger alerts in case of any job failures, ensuring quick responses to issues.

File Format Optimization: Currently, the data from the API is stored in JSON format, which isn't efficient for large datasets. Switching to Parquet format would significantly enhance query performance due to its columnar storage and smaller file sizes.

File Compression: The current uncompressed files could be optimized using compression. I would have used gzip or snappy compression. This would reduce storage requirements and improve read times, further enhancing query performance.

Database Consideration: Since Athena is not a full-fledged database but a query service for data lakes, I would consider migrating to Amazon Redshift for better support of DML operations. Redshift’s ACID compliance would ensure transactional integrity and more complex data operations.

Production-Ready Solution: For a production environment, I would implement Apache Airflow for better orchestration, scalability, and managing workflows across multiple tasks instead of Lambda architecture.

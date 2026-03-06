-- Load data from S3 into Redshift tables using the COPY command and IAM Roles
-- Note: Replace <REDSHIFT-ROLE-ARN> with your actual IAM Role ARN in a live environment

-- Load Users Data (Tab delimited)
COPY users 
FROM 's3://aws-tc-largeobjects/CUR-TF-200-ACDSCI-1/Lab4/allusers_tab.txt'
CREDENTIALS 'aws_iam_role=<REDSHIFT-ROLE-ARN>'
DELIMITER '\t' REGION 'us-west-2';

-- Load Date Data (Pipe delimited)
COPY date 
FROM 's3://aws-tc-largeobjects/CUR-TF-200-ACDSCI-1/Lab4/date2008_pipe.txt'
CREDENTIALS 'aws_iam_role=<REDSHIFT-ROLE-ARN>'
DELIMITER '|' REGION 'us-west-2';

-- Load Sales Data (Tab delimited with specific time format)
COPY sales 
FROM 's3://aws-tc-largeobjects/CUR-TF-200-ACDSCI-1/Lab4/sales_tab.txt'
CREDENTIALS 'aws_iam_role=<REDSHIFT-ROLE-ARN>'
DELIMITER '\t' TIMEFORMAT 'MM/DD/YYYY HH:MI:SS' REGION 'us-west-2';
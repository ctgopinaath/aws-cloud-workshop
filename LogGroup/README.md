# AWS CloudWatch Log Groups Workshop 📝

![CloudWatch Logs](logs-logo.png)

## 📋 Overview

CloudWatch Log Groups provide centralized log management for AWS services and applications. This module covers creating, configuring, and managing log groups, log streams, and log events through the AWS Management Console.

## 🎯 Learning Objectives

By the end of this module, you will be able to:
- ✅ Create and configure CloudWatch Log Groups
- ✅ Manage log streams and retention policies
- ✅ Set up log filtering and metric extraction
- ✅ Configure log subscriptions and exports
- ✅ Use CloudWatch Logs Insights for analysis
- ✅ Implement log encryption and access control

## 📋 Prerequisites

- AWS Account with CloudWatch Logs permissions
- Running AWS services that generate logs (Lambda, EC2, etc.)
- Basic understanding of logging concepts
- Text editor for log analysis

## 🚀 Step-by-Step Guide

### Step 1: Access CloudWatch Logs

1. **Navigate to CloudWatch Console**
   - Sign in to AWS Management Console
   - Search for "CloudWatch" and select the service
   - Click "Logs" in the left navigation panel
   - Select "Log groups"

![Logs Console](screenshots/logs-console.png)

2. **Log Groups Overview**
   - View existing log groups from AWS services
   - See log group details: size, retention, streams
   - Access log group management options

![Log Groups Overview](screenshots/log-groups-overview.png)

### Step 2: Create Log Group

1. **Start Log Group Creation**
   - Click "Create log group" button
   - Enter log group configuration details

![Create Log Group](screenshots/create-log-group.png)

2. **Configure Log Group Settings**
   - **Log group name**: Enter descriptive name (e.g., "/my-app/production")
   - **Retention setting**: Choose retention period (1 day to Never expire)
   - **KMS key**: Optional encryption key for log data
   - **Tags**: Add key-value pairs for organization

![Log Group Settings](screenshots/log-group-settings.png)

3. **Naming Conventions**
   - AWS services: `/aws/service/resource-name`
   - Applications: `/application/environment/component`
   - Custom format: `/company/project/service`

4. **Retention Period Options**
   - 1 day, 3 days, 5 days, 1 week, 2 weeks
   - 1 month, 2 months, 3 months, 4 months, 5 months, 6 months
   - 1 year, 13 months, 18 months, 2 years, 5 years, 10 years
   - Never expire

![Retention Options](screenshots/retention-options.png)

5. **Complete Creation**
   - Review settings
   - Click "Create" to create log group
   - Log group appears in the list

![Log Group Created](screenshots/log-group-created.png)

### Step 3: Manage Log Streams

1. **View Log Streams**
   - Click on log group name
   - See all log streams within the group
   - Each stream represents a source of log events

![Log Streams](screenshots/log-streams.png)

2. **Log Stream Details**
   - **Stream name**: Unique identifier
   - **Creation time**: When stream was created
   - **Last event time**: Most recent log entry
   - **Upload sequence token**: For programmatic access

3. **View Log Events**
   - Click on log stream name
   - See individual log events with timestamps
   - Use time range selector for filtering

![Log Events](screenshots/log-events.png)

4. **Search and Filter Logs**
   - Use filter box to search log content
   - Enter search terms or patterns
   - Apply time range filters

![Search Logs](screenshots/search-logs.png)

### Step 4: Configure Log Retention

1. **Modify Retention Policy**
   - Select log group from list
   - Click "Actions" → "Edit retention setting"

![Edit Retention](screenshots/edit-retention.png)

2. **Update Retention Period**
   - Choose new retention period
   - Consider cost and compliance requirements
   - Click "Save" to apply changes

![Update Retention](screenshots/update-retention.png)

3. **Retention Impact**
   - Older logs automatically deleted
   - Reduces storage costs
   - May affect compliance requirements
   - Cannot recover deleted logs

### Step 5: Set Up Metric Filters

1. **Create Metric Filter**
   - Select log group
   - Click "Actions" → "Create metric filter"

![Create Metric Filter](screenshots/create-metric-filter.png)

2. **Define Filter Pattern**
   - **Filter pattern**: Specify what to match
   - **Test pattern**: Test against sample log data
   - Common patterns:
     - `ERROR` - Match error messages
     - `[timestamp, request_id, level="ERROR"]` - Structured logs
     - `{ $.level = "ERROR" }` - JSON logs

![Filter Pattern](screenshots/filter-pattern.png)

3. **Configure Metric Details**
   - **Metric namespace**: Custom namespace (e.g., "MyApp/Errors")
   - **Metric name**: Descriptive name (e.g., "ErrorCount")
   - **Metric value**: What to count (usually 1)
   - **Default value**: Value when no matches (usually 0)

![Metric Details](screenshots/metric-details.png)

4. **Test and Create**
   - Test filter against log data
   - Verify metric extraction works
   - Click "Create filter"

![Test Filter](screenshots/test-filter.png)

### Step 6: Configure Subscription Filters

1. **Create Subscription Filter**
   - Select log group
   - Click "Actions" → "Create subscription filter"

![Create Subscription](screenshots/create-subscription.png)

2. **Choose Destination**
   - **Lambda function**: Process logs in real-time
   - **Amazon Kinesis Data Streams**: Stream to analytics
   - **Amazon Kinesis Data Firehose**: Deliver to S3, Redshift, etc.

![Subscription Destination](screenshots/subscription-destination.png)

3. **Configure Lambda Destination**
   - **Lambda function**: Select existing function
   - **Log format**: Choose format (JSON, CSV, etc.)
   - **Filter pattern**: Optional filtering
   - **Subscription filter name**: Descriptive name

![Lambda Subscription](screenshots/lambda-subscription.png)

4. **Set Up Permissions**
   - Grant CloudWatch Logs permission to invoke Lambda
   - Configure IAM roles as needed
   - Test subscription functionality

### Step 7: Export Logs to S3

1. **Start Export Task**
   - Select log group
   - Click "Actions" → "Export data to Amazon S3"

![Export to S3](screenshots/export-s3.png)

2. **Configure Export Settings**
   - **S3 bucket**: Choose destination bucket
   - **S3 key prefix**: Optional prefix for organization
   - **Time range**: Select logs to export
   - **Log stream prefix**: Filter by stream names

![Export Settings](screenshots/export-settings.png)

3. **Monitor Export Progress**
   - View export task status
   - Check S3 bucket for exported files
   - Files are compressed and organized by time

![Export Progress](screenshots/export-progress.png)

### Step 8: Use CloudWatch Logs Insights

1. **Access Logs Insights**
   - Click "Logs" → "Insights" in navigation
   - Select log groups to query

![Logs Insights](screenshots/logs-insights.png)

2. **Write Queries**
   - Use CloudWatch Logs Insights query language
   - Start with sample queries
   - Build custom queries for analysis

```sql
# Find all ERROR messages
fields @timestamp, @message
| filter @message like /ERROR/
| sort @timestamp desc
| limit 20
```

![Insights Query](screenshots/insights-query.png)

3. **Advanced Query Examples**

```sql
# Analyze Lambda function performance
fields @timestamp, @duration, @billedDuration, @memorySize, @maxMemoryUsed
| filter @type = "REPORT"
| stats avg(@duration), max(@duration), min(@duration) by bin(5m)
```

```sql
# Count errors by hour
fields @timestamp, @message
| filter @message like /ERROR/
| stats count() by bin(1h)
```

```sql
# Find slow API requests
fields @timestamp, @message
| filter @message like /response_time/
| parse @message "response_time: * ms" as response_time
| filter response_time > 1000
| sort @timestamp desc
```

![Advanced Queries](screenshots/advanced-queries.png)

4. **Visualize Results**
   - View results in table format
   - Create charts from query results
   - Export results to CSV

![Query Results](screenshots/query-results.png)

### Step 9: Configure Log Encryption

1. **Enable Encryption**
   - Select log group
   - Click "Actions" → "Edit"
   - Enable KMS encryption

![Enable Encryption](screenshots/enable-encryption.png)

2. **Choose KMS Key**
   - **AWS managed key**: Default CloudWatch Logs key
   - **Customer managed key**: Your own KMS key
   - **Key from another account**: Cross-account key

![Choose KMS Key](screenshots/choose-kms-key.png)

3. **Encryption Benefits**
   - Data encrypted at rest
   - Secure log storage
   - Compliance requirements
   - Access control through KMS

### Step 10: Monitor Log Group Metrics

1. **View Log Group Metrics**
   - Navigate to CloudWatch Metrics
   - Select "AWS/Logs" namespace
   - View log group specific metrics

![Log Metrics](screenshots/log-metrics.png)

2. **Key Metrics**
   - **IncomingLogEvents**: Number of log events
   - **IncomingBytes**: Volume of log data
   - **ForwardedLogEvents**: Events sent to destinations
   - **DeliveryErrors**: Failed deliveries

3. **Create Alarms**
   - Set up alarms for log volume
   - Monitor delivery failures
   - Alert on unusual patterns

## 🔧 Advanced Log Management

### Structured Logging Best Practices

1. **JSON Format Example**
```json
{
  "timestamp": "2024-01-15T10:30:00Z",
  "level": "ERROR",
  "service": "user-service",
  "request_id": "req-123456",
  "user_id": "user-789",
  "message": "Failed to authenticate user",
  "error_code": "AUTH_FAILED",
  "duration_ms": 150
}
```

2. **Consistent Field Names**
   - Use standard field names across services
   - Include correlation IDs
   - Add contextual information
   - Maintain consistent timestamp format

### Log Aggregation Patterns

1. **Multi-Service Logging**
   - Create log groups per service
   - Use consistent naming conventions
   - Implement centralized monitoring
   - Cross-reference with correlation IDs

2. **Environment Separation**
   - Separate log groups by environment
   - Different retention policies per environment
   - Environment-specific access controls
   - Cost optimization by environment

### Custom Log Shipping

1. **CloudWatch Agent Configuration**
```json
{
  "logs": {
    "logs_collected": {
      "files": {
        "collect_list": [
          {
            "file_path": "/var/log/myapp/*.log",
            "log_group_name": "/my-app/production",
            "log_stream_name": "{instance_id}",
            "timezone": "UTC",
            "timestamp_format": "%Y-%m-%d %H:%M:%S"
          }
        ]
      }
    }
  }
}
```

2. **Application Integration**
```python
import boto3
import json
from datetime import datetime

def send_log_event(log_group, log_stream, message, level="INFO"):
    client = boto3.client('logs')
    
    log_event = {
        'timestamp': int(datetime.utcnow().timestamp() * 1000),
        'message': json.dumps({
            'level': level,
            'message': message,
            'service': 'my-app',
            'timestamp': datetime.utcnow().isoformat()
        })
    }
    
    try:
        client.put_log_events(
            logGroupName=log_group,
            logStreamName=log_stream,
            logEvents=[log_event]
        )
    except Exception as e:
        print(f"Failed to send log: {e}")
```

## 💰 Cost Optimization

### Pricing Components

- **Log ingestion**: $0.50 per GB
- **Log storage**: $0.03 per GB per month
- **Log insights queries**: $0.005 per GB scanned
- **Vended logs**: Varies by service

### Cost Optimization Strategies

1. **Retention Management**
   - Set appropriate retention periods
   - Archive old logs to S3 Glacier
   - Delete unnecessary log groups
   - Use lifecycle policies

2. **Log Volume Reduction**
   - Filter logs at source
   - Reduce log verbosity in production
   - Sample high-volume logs
   - Compress log data

3. **Query Optimization**
   - Use specific time ranges
   - Filter early in queries
   - Limit result sets
   - Cache frequent queries

### Cost Monitoring

1. **Set Up Billing Alerts**
   - Monitor CloudWatch Logs costs
   - Set up budget alerts
   - Track cost trends
   - Identify cost drivers

2. **Usage Analysis**
   - Analyze log volume by service
   - Identify high-cost log groups
   - Review retention policies
   - Optimize based on usage patterns

## 🛡️ Security Best Practices

### Access Control

1. **IAM Policies**
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:log-group:/my-app/*"
    }
  ]
}
```

2. **Resource-Based Policies**
   - Control access to specific log groups
   - Cross-account access management
   - Service-specific permissions
   - Conditional access based on context

### Data Protection

1. **Encryption at Rest**
   - Use KMS encryption for sensitive logs
   - Manage encryption keys properly
   - Regular key rotation
   - Access logging for keys

2. **Encryption in Transit**
   - HTTPS for API calls
   - TLS for log shipping
   - Secure agent configuration
   - Certificate management

### Compliance Considerations

1. **Data Retention**
   - Meet regulatory requirements
   - Document retention policies
   - Secure deletion procedures
   - Audit trail maintenance

2. **Access Auditing**
   - Log access to log groups
   - Monitor query activities
   - Track data exports
   - Regular access reviews

## 🔍 Troubleshooting Guide

### Common Issues

1. **Logs Not Appearing**
   - Check IAM permissions
   - Verify log group exists
   - Confirm agent configuration
   - Check network connectivity

2. **High Costs**
   - Review retention settings
   - Analyze log volume
   - Check for log loops
   - Optimize query usage

3. **Query Performance**
   - Use specific time ranges
   - Add filters early
   - Limit result sets
   - Check log group size

### Debugging Steps

1. **Verify Configuration**
   - Check log group settings
   - Validate IAM permissions
   - Test connectivity
   - Review agent logs

2. **Monitor Metrics**
   - Check ingestion rates
   - Monitor error rates
   - Track delivery status
   - Analyze usage patterns

## 🎯 Practice Exercises

### Exercise 1: Basic Log Management
1. Create log group for web application
2. Configure 30-day retention
3. Set up metric filter for errors
4. Create alarm for error rate

### Exercise 2: Log Analysis with Insights
1. Generate sample log data
2. Write queries to find patterns
3. Create visualizations
4. Export results for reporting

### Exercise 3: Log Streaming Setup
1. Configure subscription filter
2. Set up Lambda processing function
3. Stream logs to S3 via Kinesis
4. Monitor streaming performance

### Exercise 4: Multi-Environment Setup
1. Create log groups for dev/staging/prod
2. Configure different retention policies
3. Set up environment-specific access
4. Implement cost monitoring

## 📚 Integration Examples

### Lambda Log Processing Function

```python
import json
import gzip
import base64
import boto3

def lambda_handler(event, context):
    # Decode CloudWatch Logs data
    cw_data = event['awslogs']['data']
    compressed_payload = base64.b64decode(cw_data)
    uncompressed_payload = gzip.decompress(compressed_payload)
    log_data = json.loads(uncompressed_payload)
    
    # Process log events
    for log_event in log_data['logEvents']:
        message = log_event['message']
        timestamp = log_event['timestamp']
        
        # Custom processing logic
        if 'ERROR' in message:
            # Send to alerting system
            send_alert(message, timestamp)
        
        # Store in database, send to analytics, etc.
        process_log_event(message, timestamp)
    
    return {'statusCode': 200}

def send_alert(message, timestamp):
    # Implementation for alerting
    pass

def process_log_event(message, timestamp):
    # Implementation for processing
    pass
```

### Terraform Configuration

```hcl
resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/my-app/production"
  retention_in_days = 30
  kms_key_id        = aws_kms_key.log_key.arn

  tags = {
    Environment = "production"
    Application = "my-app"
  }
}

resource "aws_cloudwatch_log_metric_filter" "error_filter" {
  name           = "ErrorCount"
  log_group_name = aws_cloudwatch_log_group.app_logs.name
  pattern        = "ERROR"

  metric_transformation {
    name      = "ErrorCount"
    namespace = "MyApp/Errors"
    value     = "1"
  }
}
```

## 📚 Additional Resources

- [CloudWatch Logs User Guide](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/)
- [Logs Insights Query Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html)
- [CloudWatch Agent Configuration](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html)
- [Best Practices](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html)

---

**Next Module:** [AWS Lambda →](../Lambda/)
# AWS CloudWatch Workshop 📊

![CloudWatch Logo](cloudwatch-logo.png)

## 📋 Overview

Amazon CloudWatch is a monitoring and observability service that provides data and actionable insights for AWS resources and applications. This module covers metrics, logs, dashboards, and alarms through the AWS Management Console.

## 🎯 Learning Objectives

By the end of this module, you will be able to:
- ✅ Navigate CloudWatch console and understand key concepts
- ✅ Create custom dashboards and widgets
- ✅ Monitor EC2, Lambda, and other AWS service metrics
- ✅ Set up CloudWatch Logs and log groups
- ✅ Create and configure CloudWatch Alarms
- ✅ Use CloudWatch Insights for log analysis

## 📋 Prerequisites

- AWS Account with CloudWatch permissions
- Running AWS resources (EC2, Lambda, etc.) for monitoring
- Basic understanding of AWS services
- Familiarity with metrics and logging concepts

## 🚀 Step-by-Step Guide

### Step 1: Access CloudWatch Console

1. **Sign in to AWS Management Console**
   - Navigate to [AWS Console](https://console.aws.amazon.com)
   - Enter your credentials

2. **Open CloudWatch Service**
   - In the search bar, type "CloudWatch"
   - Click on "CloudWatch"
   - Or navigate to Services → Management & Governance → CloudWatch

![CloudWatch Console](screenshots/cloudwatch-console.png)

### Step 2: Explore CloudWatch Overview

1. **Dashboard Overview**
   - View the main CloudWatch dashboard
   - See recent alarms and metrics
   - Check service health overview

![CloudWatch Overview](screenshots/cloudwatch-overview.png)

2. **Navigation Menu**
   - **Dashboards**: Custom metric visualizations
   - **Alarms**: Threshold-based notifications
   - **Logs**: Centralized log management
   - **Metrics**: Time-series data from AWS services
   - **Events**: Deprecated (use EventBridge)
   - **Insights**: Log analysis and querying

### Step 3: Create Custom Dashboard

1. **Click "Dashboards" in Left Menu**
   - Select "Dashboards" from navigation
   - Click "Create dashboard"

![Create Dashboard](screenshots/create-dashboard.png)

2. **Configure Dashboard**
   - **Dashboard name**: Enter name (e.g., "MyAppDashboard")
   - Click "Create dashboard"

![Dashboard Name](screenshots/dashboard-name.png)

3. **Add Widgets**
   - Choose widget type:
     - **Line**: Time-series line chart
     - **Stacked area**: Stacked area chart
     - **Number**: Single metric value
     - **Gauge**: Gauge visualization
     - **Pie**: Pie chart
     - **Bar**: Bar chart
     - **Text**: Custom text widget

![Widget Types](screenshots/widget-types.png)

4. **Configure Line Widget**
   - Select "Line" widget type
   - Click "Configure"

![Configure Widget](screenshots/configure-widget.png)

5. **Select Metrics**
   - **Browse**: Browse by service
   - **Search**: Search for specific metrics
   - **Custom**: Enter custom metric
   - Select "EC2" → "Per-Instance Metrics"

![Select Metrics](screenshots/select-metrics.png)

6. **Choose EC2 Metrics**
   - Select your EC2 instance
   - Choose metrics (CPUUtilization, NetworkIn, NetworkOut)
   - Click "Create widget"

![EC2 Metrics](screenshots/ec2-metrics.png)

7. **Customize Widget**
   - **Title**: Enter widget title
   - **Y-axis**: Configure axis settings
   - **Legend**: Show/hide legend
   - **Period**: Set data aggregation period
   - Click "Create widget"

![Widget Customization](screenshots/widget-customization.png)

8. **Save Dashboard**
   - Click "Save dashboard"
   - Dashboard is now available in dashboards list

![Save Dashboard](screenshots/save-dashboard.png)

### Step 4: Monitor AWS Service Metrics

1. **EC2 Metrics**
   - Navigate to "Metrics" → "All metrics"
   - Click "EC2" namespace
   - Select "Per-Instance Metrics"

![EC2 Metrics Navigation](screenshots/ec2-metrics-nav.png)

2. **Key EC2 Metrics**
   - **CPUUtilization**: CPU usage percentage
   - **NetworkIn/NetworkOut**: Network traffic
   - **DiskReadOps/DiskWriteOps**: Disk operations
   - **StatusCheckFailed**: Instance health

3. **Lambda Metrics**
   - Click "AWS/Lambda" namespace
   - Select "By Function Name"
   - Choose your Lambda function

![Lambda Metrics](screenshots/lambda-metrics.png)

4. **Key Lambda Metrics**
   - **Invocations**: Function execution count
   - **Duration**: Execution time
   - **Errors**: Error count
   - **Throttles**: Throttling events

5. **S3 Metrics**
   - Click "AWS/S3" namespace
   - Select "Daily Storage Metrics for Buckets"

![S3 Metrics](screenshots/s3-metrics.png)

### Step 5: Work with CloudWatch Logs

1. **Access Log Groups**
   - Click "Logs" in left navigation
   - Select "Log groups"

![Log Groups](screenshots/log-groups.png)

2. **View Existing Log Groups**
   - See log groups from various services
   - Examples: `/aws/lambda/function-name`, `/aws/ec2/instance-id`
   - Click on log group to view details

![View Log Groups](screenshots/view-log-groups.png)

3. **Create Custom Log Group**
   - Click "Create log group"
   - **Log group name**: Enter name (e.g., "/my-app/logs")
   - **Retention setting**: Choose retention period
   - **KMS key**: Optional encryption key
   - Click "Create"

![Create Log Group](screenshots/create-log-group.png)

4. **View Log Streams**
   - Click on log group name
   - See individual log streams
   - Click on stream to view log events

![Log Streams](screenshots/log-streams.png)

5. **Search Log Events**
   - Use filter box to search logs
   - Enter search terms or patterns
   - Use time range selector

![Search Logs](screenshots/search-logs.png)

### Step 6: Use CloudWatch Insights

1. **Access Insights**
   - Click "Logs" → "Insights"
   - Select log groups to query

![CloudWatch Insights](screenshots/insights.png)

2. **Write Queries**
   - Use CloudWatch Insights query language
   - Example queries:

```sql
# Find error messages
fields @timestamp, @message
| filter @message like /ERROR/
| sort @timestamp desc
| limit 20
```

```sql
# Analyze Lambda duration
fields @timestamp, @duration
| filter @type = "REPORT"
| stats avg(@duration), max(@duration), min(@duration) by bin(5m)
```

![Insights Query](screenshots/insights-query.png)

3. **Run and Visualize**
   - Click "Run query"
   - View results in table format
   - Create visualizations from results

![Query Results](screenshots/query-results.png)

### Step 7: Set Up CloudWatch Alarms

1. **Navigate to Alarms**
   - Click "Alarms" in left navigation
   - Click "Create alarm"

![Create Alarm](screenshots/create-alarm.png)

2. **Select Metric**
   - Click "Select metric"
   - Choose service and metric
   - Example: EC2 → Per-Instance Metrics → CPUUtilization

![Select Alarm Metric](screenshots/select-alarm-metric.png)

3. **Configure Conditions**
   - **Threshold type**: Static or Anomaly detection
   - **Whenever CPUUtilization is**: Greater than
   - **Than**: 80 (threshold value)
   - **Datapoints to alarm**: 2 out of 2

![Alarm Conditions](screenshots/alarm-conditions.png)

4. **Configure Actions**
   - **Alarm state trigger**: In alarm
   - **Send notification to**: Select SNS topic
   - **Create new topic**: If needed
   - **Email endpoints**: Enter email addresses

![Alarm Actions](screenshots/alarm-actions.png)

5. **Add Name and Description**
   - **Alarm name**: Enter descriptive name
   - **Alarm description**: Optional description
   - Click "Create alarm"

![Alarm Name](screenshots/alarm-name.png)

### Step 8: Monitor Alarm Status

1. **View Alarm Dashboard**
   - See all alarms and their states
   - States: OK, ALARM, INSUFFICIENT_DATA

![Alarm Dashboard](screenshots/alarm-dashboard.png)

2. **Alarm History**
   - Click on alarm name
   - View "History" tab
   - See state changes and reasons

![Alarm History](screenshots/alarm-history.png)

3. **Test Alarm**
   - Manually trigger alarm condition
   - Verify notification delivery
   - Check alarm state changes

## 📊 Advanced Dashboard Features

### Multi-Service Dashboard

1. **Add Multiple Service Widgets**
   - EC2 CPU utilization
   - Lambda invocations and errors
   - S3 bucket size
   - RDS connections

2. **Custom Metrics Widget**
   - Add custom application metrics
   - Use CloudWatch Agent metrics
   - Display business KPIs

![Multi-Service Dashboard](screenshots/multi-service-dashboard.png)

### Dashboard Sharing

1. **Share Dashboard**
   - Click "Share dashboard"
   - Generate shareable link
   - Set permissions and access

2. **Export Dashboard**
   - Export as JSON
   - Import to other accounts
   - Version control dashboards

## 🔧 CloudWatch Agent Setup

### Install on EC2 Instance

1. **Download Agent**
```bash
wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
sudo rpm -U ./amazon-cloudwatch-agent.rpm
```

2. **Configure Agent**
```bash
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
```

3. **Start Agent**
```bash
sudo systemctl start amazon-cloudwatch-agent
sudo systemctl enable amazon-cloudwatch-agent
```

### Custom Metrics Configuration

```json
{
  "metrics": {
    "namespace": "MyApp/Performance",
    "metrics_collected": {
      "cpu": {
        "measurement": ["cpu_usage_idle", "cpu_usage_iowait"],
        "metrics_collection_interval": 60
      },
      "disk": {
        "measurement": ["used_percent"],
        "metrics_collection_interval": 60,
        "resources": ["*"]
      },
      "mem": {
        "measurement": ["mem_used_percent"],
        "metrics_collection_interval": 60
      }
    }
  }
}
```

## 📝 Log Management Best Practices

### Log Group Organization

1. **Naming Convention**
   - `/aws/service/resource-name`
   - `/application/environment/component`
   - `/company/project/service`

2. **Retention Policies**
   - Development: 7-30 days
   - Production: 90 days to 1 year
   - Compliance: As required

### Log Filtering and Parsing

1. **Metric Filters**
   - Extract metrics from log data
   - Count error occurrences
   - Monitor application performance

2. **Subscription Filters**
   - Stream logs to other services
   - Real-time log processing
   - Integration with Elasticsearch

## 🚨 Alarm Strategies

### Threshold-Based Alarms

```
CPU Utilization > 80% for 2 consecutive periods
Memory Usage > 90% for 1 period
Error Rate > 5% for 3 consecutive periods
Response Time > 2 seconds for 2 periods
```

### Anomaly Detection Alarms

1. **Enable Anomaly Detection**
   - CloudWatch learns normal patterns
   - Automatically adjusts thresholds
   - Reduces false positives

2. **Configure Anomaly Detector**
   - Select metric for analysis
   - Set anomaly detection threshold
   - Configure alarm actions

![Anomaly Detection](screenshots/anomaly-detection.png)

### Composite Alarms

1. **Create Composite Alarm**
   - Combine multiple alarms
   - Use AND/OR logic
   - Reduce alarm noise

```
(CPUAlarm OR MemoryAlarm) AND ErrorRateAlarm
```

## 💰 Cost Optimization

### Pricing Components

- **Metrics**: $0.30 per metric per month
- **Alarms**: $0.10 per alarm per month
- **Logs**: $0.50 per GB ingested
- **Dashboards**: $3.00 per dashboard per month

### Cost Optimization Tips

1. **Log Retention Management**
   - Set appropriate retention periods
   - Archive old logs to S3
   - Use log filtering to reduce volume

2. **Metric Optimization**
   - Remove unused custom metrics
   - Use metric filters instead of custom metrics
   - Aggregate metrics at application level

3. **Dashboard Optimization**
   - Consolidate related dashboards
   - Use shared dashboards
   - Remove unused widgets

## 🔍 Troubleshooting Guide

### Common Issues

1. **Missing Metrics**
   - Check IAM permissions
   - Verify CloudWatch agent configuration
   - Ensure services are running

2. **Alarm Not Triggering**
   - Verify threshold settings
   - Check metric data availability
   - Review alarm conditions

3. **Log Events Not Appearing**
   - Check log group permissions
   - Verify log stream creation
   - Review CloudWatch agent logs

### Debugging Steps

1. **Check Service Health**
   - Verify AWS service status
   - Check regional availability
   - Review service limits

2. **Validate Configurations**
   - Test alarm conditions manually
   - Verify SNS topic subscriptions
   - Check dashboard widget settings

## 📊 Monitoring Best Practices

### Key Metrics to Monitor

1. **Infrastructure Metrics**
   - CPU, Memory, Disk utilization
   - Network throughput
   - System load average

2. **Application Metrics**
   - Response time
   - Error rates
   - Throughput (requests/second)
   - Business KPIs

3. **AWS Service Metrics**
   - Lambda duration and errors
   - RDS connections and CPU
   - S3 request rates
   - API Gateway latency

### Alerting Strategy

1. **Severity Levels**
   - **Critical**: Immediate response required
   - **Warning**: Monitor closely
   - **Info**: Awareness only

2. **Escalation Procedures**
   - Primary on-call notification
   - Secondary escalation after timeout
   - Management notification for critical issues

## 🎯 Practice Exercises

1. **Comprehensive Monitoring Setup**
   - Create dashboard for multi-tier application
   - Set up alarms for all critical metrics
   - Configure log aggregation and analysis

2. **Cost Optimization Project**
   - Audit existing CloudWatch usage
   - Implement retention policies
   - Optimize metric collection

3. **Incident Response Simulation**
   - Trigger alarm conditions
   - Practice incident response procedures
   - Document lessons learned

4. **Custom Metrics Implementation**
   - Implement application-specific metrics
   - Create business KPI dashboards
   - Set up automated reporting

## 📚 Additional Resources

- [CloudWatch User Guide](https://docs.aws.amazon.com/cloudwatch/)
- [CloudWatch Agent Guide](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Install-CloudWatch-Agent.html)
- [CloudWatch Insights Query Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html)
- [Best Practices](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html)

---

**Next Module:** [CloudWatch Alarms →](../Alarms/)
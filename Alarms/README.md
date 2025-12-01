# AWS CloudWatch Alarms Workshop 🚨

![CloudWatch Alarms](alarms-logo.png)

## 📋 Overview

CloudWatch Alarms monitor metrics and automatically trigger actions when thresholds are breached. This module provides detailed guidance on creating, configuring, and managing alarms through the AWS Management Console.

## 🎯 Learning Objectives

By the end of this module, you will be able to:
- ✅ Create and configure various types of CloudWatch alarms
- ✅ Set up alarm actions and notifications
- ✅ Use anomaly detection for dynamic thresholds
- ✅ Create composite alarms for complex scenarios
- ✅ Monitor and troubleshoot alarm behavior
- ✅ Implement alarm best practices

## 📋 Prerequisites

- AWS Account with CloudWatch permissions
- Existing AWS resources to monitor (EC2, Lambda, RDS, etc.)
- SNS topic configured for notifications
- Basic understanding of CloudWatch metrics

## 🚀 Step-by-Step Guide

### Step 1: Access CloudWatch Alarms

1. **Navigate to CloudWatch Console**
   - Sign in to AWS Management Console
   - Search for "CloudWatch" and select the service
   - Click "Alarms" in the left navigation panel

![Alarms Console](screenshots/alarms-console.png)

2. **Alarms Overview**
   - View existing alarms and their states
   - See alarm summary by state (OK, ALARM, INSUFFICIENT_DATA)
   - Access alarm history and recent activity

![Alarms Overview](screenshots/alarms-overview.png)

### Step 2: Create Basic Metric Alarm

1. **Start Alarm Creation**
   - Click "Create alarm" button
   - Select "Select metric" to choose what to monitor

![Create Alarm](screenshots/create-alarm-start.png)

2. **Select Metric Source**
   - Choose from available metric namespaces
   - Common sources: EC2, Lambda, RDS, S3, Custom metrics
   - Click on desired service (e.g., "EC2")

![Select Metric Source](screenshots/select-metric-source.png)

3. **Choose Specific Metric**
   - Navigate through metric categories
   - For EC2: Select "Per-Instance Metrics"
   - Choose your instance and metric (e.g., CPUUtilization)
   - Click "Select metric"

![Choose Metric](screenshots/choose-metric.png)

4. **Configure Metric and Conditions**
   - **Statistic**: Average, Sum, Maximum, Minimum, Sample Count
   - **Period**: Time interval for metric evaluation (1 min, 5 min, etc.)
   - **Threshold type**: Static or Anomaly detection
   - **Condition**: Greater than, Less than, etc.
   - **Threshold value**: Enter numeric threshold

![Configure Conditions](screenshots/configure-conditions.png)

5. **Additional Configuration**
   - **Datapoints to alarm**: How many periods must breach threshold
   - **Missing data treatment**: How to handle missing data points
   - **Percentiles**: For percentile-based metrics

![Additional Config](screenshots/additional-config.png)

### Step 3: Configure Alarm Actions

1. **Set Up Notification Actions**
   - **Alarm state trigger**: When alarm should trigger
   - **In alarm**: When threshold is breached
   - **OK**: When metric returns to normal
   - **INSUFFICIENT_DATA**: When not enough data available

![Alarm Actions](screenshots/alarm-actions.png)

2. **SNS Notification Setup**
   - **Send notification to**: Select existing SNS topic
   - **Create new topic**: If no topic exists
   - **Topic name**: Enter descriptive name
   - **Email endpoints**: Add email addresses for notifications

![SNS Setup](screenshots/sns-setup.png)

3. **Auto Scaling Actions (Optional)**
   - **Auto Scaling action**: Scale EC2 instances
   - **Auto Scaling group**: Select target group
   - **Action**: Scale up or scale down
   - **Capacity**: Number of instances to add/remove

![Auto Scaling Actions](screenshots/autoscaling-actions.png)

4. **EC2 Actions (Optional)**
   - **EC2 action**: Stop, terminate, or reboot instance
   - **Instance**: Select target instance
   - **Action type**: Choose appropriate action

![EC2 Actions](screenshots/ec2-actions.png)

### Step 4: Name and Create Alarm

1. **Alarm Details**
   - **Alarm name**: Enter descriptive name (e.g., "HighCPUUtilization")
   - **Alarm description**: Optional detailed description
   - **Treat missing data as**: Choose appropriate option

![Alarm Details](screenshots/alarm-details.png)

2. **Review Configuration**
   - Review all settings before creation
   - Verify metric, conditions, and actions
   - Click "Create alarm"

![Review Alarm](screenshots/review-alarm.png)

3. **Alarm Created Successfully**
   - Alarm appears in alarms list
   - Initial state may be "INSUFFICIENT_DATA"
   - Wait for metric data to populate

![Alarm Created](screenshots/alarm-created.png)

### Step 5: Create Anomaly Detection Alarm

1. **Select Anomaly Detection**
   - When creating alarm, choose "Anomaly detection" as threshold type
   - CloudWatch learns normal metric patterns
   - Automatically adjusts thresholds based on historical data

![Anomaly Detection](screenshots/anomaly-detection.png)

2. **Configure Anomaly Detector**
   - **Anomaly threshold**: How far from normal to trigger (1-10)
   - **Exclude time ranges**: Skip certain periods from learning
   - **Metric math**: Use mathematical expressions

![Configure Anomaly](screenshots/configure-anomaly.png)

3. **Anomaly Detection Benefits**
   - Reduces false positives
   - Adapts to changing patterns
   - Handles seasonal variations
   - No manual threshold tuning

### Step 6: Create Composite Alarm

1. **Access Composite Alarms**
   - In CloudWatch Alarms console
   - Click "Create alarm" → "Create composite alarm"

![Composite Alarm](screenshots/composite-alarm.png)

2. **Define Alarm Rule**
   - Use Boolean logic to combine alarms
   - **AND**: All conditions must be true
   - **OR**: Any condition can be true
   - **NOT**: Invert alarm state

```
Example: (CPUAlarm OR MemoryAlarm) AND NOT MaintenanceMode
```

![Alarm Rule](screenshots/alarm-rule.png)

3. **Select Child Alarms**
   - Choose existing alarms to combine
   - Use alarm names in Boolean expression
   - Validate expression syntax

![Child Alarms](screenshots/child-alarms.png)

4. **Configure Actions**
   - Set up notifications for composite alarm
   - Actions trigger only when composite condition is met
   - Reduces alarm noise and false positives

### Step 7: Monitor Alarm Performance

1. **Alarm States**
   - **OK**: Metric is within threshold
   - **ALARM**: Metric has breached threshold
   - **INSUFFICIENT_DATA**: Not enough data to evaluate

![Alarm States](screenshots/alarm-states.png)

2. **View Alarm History**
   - Click on alarm name
   - Navigate to "History" tab
   - See state changes with timestamps and reasons

![Alarm History](screenshots/alarm-history.png)

3. **Alarm Graph**
   - Visual representation of metric over time
   - Shows threshold line
   - Highlights alarm periods

![Alarm Graph](screenshots/alarm-graph.png)

### Step 8: Test Alarm Functionality

1. **Simulate Alarm Condition**
   - For CPU alarm: Run CPU-intensive process
   - For memory alarm: Consume available memory
   - For custom metrics: Send test data

2. **Verify Notifications**
   - Check email for alarm notifications
   - Verify SNS message delivery
   - Test other configured actions

3. **Monitor State Changes**
   - Watch alarm transition from OK to ALARM
   - Verify timing matches configuration
   - Check that alarm returns to OK when condition clears

## 🔧 Advanced Alarm Configurations

### Math Expressions in Alarms

1. **Create Math Expression**
   - Use multiple metrics in calculations
   - Example: Error rate = Errors / Total Requests * 100

```
SEARCH('{AWS/Lambda,FunctionName} MetricName="Errors"', 'Sum', 300) / 
SEARCH('{AWS/Lambda,FunctionName} MetricName="Invocations"', 'Sum', 300) * 100
```

![Math Expression](screenshots/math-expression.png)

2. **Common Math Expressions**
   - Error rates and percentages
   - Resource utilization ratios
   - Performance calculations
   - Business metric derivations

### Cross-Account Alarms

1. **Set Up Cross-Account Access**
   - Configure IAM roles for cross-account access
   - Share CloudWatch data between accounts
   - Create alarms in monitoring account

2. **Centralized Monitoring**
   - Monitor multiple AWS accounts
   - Consolidated alarm management
   - Unified notification system

### Regional Alarm Strategies

1. **Multi-Region Monitoring**
   - Create similar alarms across regions
   - Monitor regional service health
   - Implement failover notifications

2. **Global Service Monitoring**
   - Monitor CloudFront distributions
   - Route 53 health checks
   - Global load balancer metrics

## 📊 Alarm Best Practices

### Threshold Setting Guidelines

1. **Performance Metrics**
   - CPU: 70-80% for warning, 90%+ for critical
   - Memory: 80% for warning, 95%+ for critical
   - Disk: 80% for warning, 95%+ for critical

2. **Application Metrics**
   - Response time: 2x normal for warning, 5x for critical
   - Error rate: 1% for warning, 5%+ for critical
   - Throughput: 50% below normal for warning

3. **Business Metrics**
   - Revenue impact thresholds
   - Customer experience metrics
   - SLA compliance indicators

### Alarm Naming Conventions

```
[Environment]-[Service]-[Metric]-[Severity]
Examples:
- prod-web-cpu-high
- dev-db-connections-critical
- staging-api-latency-warning
```

### Notification Strategies

1. **Severity-Based Routing**
   - Critical: Immediate SMS/phone
   - Warning: Email notification
   - Info: Dashboard/log only

2. **Time-Based Routing**
   - Business hours: Email + Slack
   - After hours: SMS + phone
   - Weekends: Escalation procedures

## 🚨 Alarm Troubleshooting

### Common Issues

1. **Alarm Not Triggering**
   - Check metric data availability
   - Verify threshold settings
   - Review datapoints to alarm configuration
   - Validate IAM permissions

2. **False Positives**
   - Adjust threshold values
   - Increase datapoints to alarm
   - Use anomaly detection
   - Implement composite alarms

3. **Missing Notifications**
   - Verify SNS topic configuration
   - Check email subscription confirmation
   - Review SNS delivery status
   - Validate IAM permissions for SNS

### Debugging Steps

1. **Check Alarm Configuration**
   - Review metric selection
   - Verify threshold and conditions
   - Check period and statistic settings
   - Validate missing data treatment

2. **Test Notification Chain**
   - Manually trigger alarm
   - Test SNS topic directly
   - Verify email delivery
   - Check spam folders

3. **Monitor Alarm Metrics**
   - Use CloudWatch to monitor alarm behavior
   - Check alarm evaluation frequency
   - Review metric data completeness

## 💰 Cost Optimization

### Alarm Pricing

- **Standard alarms**: $0.10 per alarm per month
- **High-resolution alarms**: $0.30 per alarm per month
- **Composite alarms**: $0.50 per alarm per month

### Cost Optimization Strategies

1. **Alarm Consolidation**
   - Use composite alarms to reduce count
   - Combine related metrics
   - Remove redundant alarms

2. **Threshold Optimization**
   - Avoid overly sensitive thresholds
   - Use appropriate evaluation periods
   - Implement alarm suppression during maintenance

3. **Lifecycle Management**
   - Regular alarm audits
   - Remove alarms for decommissioned resources
   - Archive historical alarm data

## 📈 Monitoring Alarm Effectiveness

### Key Metrics to Track

1. **Alarm Performance**
   - False positive rate
   - Mean time to detection (MTTD)
   - Mean time to resolution (MTTR)
   - Alarm coverage percentage

2. **Notification Effectiveness**
   - Delivery success rate
   - Response time to notifications
   - Escalation frequency
   - Resolution time by severity

### Continuous Improvement

1. **Regular Reviews**
   - Monthly alarm effectiveness review
   - Quarterly threshold adjustments
   - Annual strategy assessment

2. **Feedback Integration**
   - Incident post-mortems
   - Team feedback on alarm quality
   - Customer impact analysis

## 🎯 Practice Exercises

### Exercise 1: Basic Alarm Setup
1. Create CPU utilization alarm for EC2 instance
2. Set threshold at 80% for 2 consecutive periods
3. Configure email notification
4. Test by generating CPU load

### Exercise 2: Composite Alarm Creation
1. Create multiple related alarms (CPU, Memory, Disk)
2. Combine using composite alarm with AND logic
3. Test composite alarm behavior
4. Compare with individual alarms

### Exercise 3: Anomaly Detection Implementation
1. Set up anomaly detection for Lambda duration
2. Let system learn for 24 hours
3. Compare with static threshold alarm
4. Analyze false positive reduction

### Exercise 4: Multi-Service Monitoring
1. Create alarms for web application stack
2. Include EC2, RDS, and Lambda metrics
3. Set up escalation procedures
4. Document incident response workflow

## 📚 Integration Examples

### Lambda Function for Custom Actions

```python
import boto3
import json

def lambda_handler(event, context):
    # Parse CloudWatch alarm
    message = json.loads(event['Records'][0]['Sns']['Message'])
    alarm_name = message['AlarmName']
    new_state = message['NewStateValue']
    
    if new_state == 'ALARM':
        # Custom action: Scale resources, send Slack message, etc.
        print(f"Alarm {alarm_name} triggered - taking action")
        
        # Example: Stop EC2 instance
        ec2 = boto3.client('ec2')
        # ec2.stop_instances(InstanceIds=['i-1234567890abcdef0'])
        
    return {
        'statusCode': 200,
        'body': json.dumps('Action completed')
    }
```

### Terraform Configuration

```hcl
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "high-cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  alarm_actions       = [aws_sns_topic.alerts.arn]

  dimensions = {
    InstanceId = aws_instance.web.id
  }
}
```

## 📚 Additional Resources

- [CloudWatch Alarms User Guide](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html)
- [Anomaly Detection](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Anomaly_Detector.html)
- [Composite Alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Create_Composite_Alarm.html)
- [Best Practices](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html)

---

**Next Module:** [CloudWatch Log Groups →](../LogGroup/)
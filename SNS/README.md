# AWS SNS (Simple Notification Service) Workshop 📧

![SNS Logo](sns-logo.png)

## 📋 Overview

Amazon Simple Notification Service (SNS) is a fully managed messaging service for both application-to-application (A2A) and application-to-person (A2P) communication. This module covers creating topics, subscriptions, and sending notifications through the AWS Management Console.

## 🎯 Learning Objectives

By the end of this module, you will be able to:
- ✅ Create and configure SNS topics
- ✅ Set up various subscription types (Email, SMS, HTTP/HTTPS)
- ✅ Publish messages to topics
- ✅ Configure message filtering
- ✅ Monitor SNS metrics and logs

## 📋 Prerequisites

- AWS Account with SNS permissions
- Valid email address for testing
- Phone number for SMS testing (optional)
- Basic understanding of pub/sub messaging

## 🚀 Step-by-Step Guide

### Step 1: Access SNS Console

1. **Sign in to AWS Management Console**
   - Navigate to [AWS Console](https://console.aws.amazon.com)
   - Enter your credentials

2. **Open SNS Service**
   - In the search bar, type "SNS"
   - Click on "Simple Notification Service"
   - Or navigate to Services → Application Integration → Simple Notification Service

![SNS Console](screenshots/sns-console.png)

### Step 2: Create SNS Topic

1. **Click "Create topic"**
   - On the SNS dashboard, click "Create topic"

![Create Topic](screenshots/create-topic.png)

2. **Choose Topic Type**
   - **Standard**: High throughput, at-least-once delivery
   - **FIFO**: Exactly-once processing, ordered delivery
   - Select "Standard" for this tutorial

![Topic Type](screenshots/topic-type.png)

3. **Configure Topic Details**
   - **Name**: Enter topic name (e.g., "MyFirstTopic")
   - **Display name**: Optional display name for SMS
   - **Description**: Brief description of topic purpose

![Topic Details](screenshots/topic-details.png)

4. **Access Policy (Optional)**
   - **Method**: Choose "Basic" or "Advanced"
   - **Publishers**: Who can publish to topic
   - **Subscribers**: Who can subscribe to topic
   - Leave default for now

![Access Policy](screenshots/access-policy.png)

5. **Encryption (Optional)**
   - Enable server-side encryption
   - Choose AWS managed key or customer managed key
   - Leave disabled for tutorial

6. **Delivery Status Logging (Optional)**
   - Configure logging for delivery attempts
   - Set up CloudWatch Logs integration
   - Skip for basic setup

7. **Tags (Optional)**
   - Add key-value pairs for organization
   - Example: Environment=Development

8. **Click "Create topic"**

![Topic Created](screenshots/topic-created.png)

### Step 3: Create Subscriptions

1. **Select Your Topic**
   - Click on the topic name from the topics list
   - Navigate to "Subscriptions" tab

![Topic Subscriptions](screenshots/topic-subscriptions.png)

2. **Create Email Subscription**
   - Click "Create subscription"
   - **Protocol**: Select "Email"
   - **Endpoint**: Enter your email address
   - Click "Create subscription"

![Email Subscription](screenshots/email-subscription.png)

3. **Confirm Email Subscription**
   - Check your email inbox
   - Click "Confirm subscription" in the email
   - Return to AWS console to verify status

![Email Confirmation](screenshots/email-confirmation.png)

4. **Create SMS Subscription (Optional)**
   - Click "Create subscription"
   - **Protocol**: Select "SMS"
   - **Endpoint**: Enter phone number with country code (+1234567890)
   - Click "Create subscription"

![SMS Subscription](screenshots/sms-subscription.png)

5. **Create HTTP/HTTPS Subscription (Optional)**
   - Click "Create subscription"
   - **Protocol**: Select "HTTP" or "HTTPS"
   - **Endpoint**: Enter webhook URL
   - Click "Create subscription"

![HTTP Subscription](screenshots/http-subscription.png)

### Step 4: Publish Messages

1. **Navigate to Topic**
   - Select your topic from the topics list
   - Click "Publish message"

![Publish Message](screenshots/publish-message.png)

2. **Configure Message Details**
   - **Subject**: Enter message subject (for email)
   - **Message body**: Enter your message content
   - **Message attributes**: Add key-value pairs (optional)

![Message Details](screenshots/message-details.png)

3. **Message Structure (Optional)**
   - **Identical payload for all delivery protocols**: Default option
   - **Custom payload for each delivery protocol**: Different messages per protocol

4. **Click "Publish message"**

![Message Published](screenshots/message-published.png)

5. **Verify Message Delivery**
   - Check email inbox for message
   - Check phone for SMS (if configured)
   - Verify HTTP endpoint received message

### Step 5: Configure Message Filtering

1. **Edit Subscription**
   - Select subscription from list
   - Click "Edit"

![Edit Subscription](screenshots/edit-subscription.png)

2. **Add Subscription Filter Policy**
   - Scroll to "Subscription filter policy"
   - Click "JSON editor"
   - Enter filter policy JSON

```json
{
  "event_type": ["order_placed", "order_cancelled"],
  "price": [{"numeric": [">=", 100]}],
  "region": ["us-east-1", "us-west-2"]
}
```

![Filter Policy](screenshots/filter-policy.png)

3. **Save Changes**
   - Click "Save changes"
   - Filter policy is now active

### Step 6: Test Message Filtering

1. **Publish Filtered Message**
   - Go to topic and click "Publish message"
   - Add message attributes that match filter:

![Filtered Message](screenshots/filtered-message.png)

```
Message attributes:
- event_type: order_placed
- price: 150
- region: us-east-1
```

2. **Publish Non-Matching Message**
   - Publish message without matching attributes
   - Verify it's not delivered to filtered subscription

### Step 7: Monitor SNS Metrics

1. **Access CloudWatch Metrics**
   - In SNS console, click "Monitoring" tab
   - Or go to CloudWatch → Metrics → SNS

![SNS Metrics](screenshots/sns-metrics.png)

2. **Key Metrics to Monitor**
   - **NumberOfMessagesPublished**: Messages sent to topic
   - **NumberOfNotificationsDelivered**: Successful deliveries
   - **NumberOfNotificationsFailed**: Failed deliveries
   - **PublishSize**: Size of published messages

![Metrics Dashboard](screenshots/metrics-dashboard.png)

3. **Create CloudWatch Alarms**
   - Click "Create alarm" on any metric
   - Set threshold and notification preferences
   - Configure alarm actions

## 📝 Message Format Examples

### Basic Text Message
```
Subject: System Alert
Message: Your application deployment completed successfully at 2024-01-15 10:30:00 UTC
```

### JSON Message with Attributes
```json
{
  "default": "Default message for all protocols",
  "email": "Detailed email message with formatting",
  "sms": "Short SMS message"
}
```

### Message with Attributes
```
Message Attributes:
- event_type: "deployment"
- severity: "info"
- timestamp: "2024-01-15T10:30:00Z"
- service: "web-app"
```

## 🔧 Advanced Configuration

### Dead Letter Queues (DLQ)

1. **Create SQS Queue for DLQ**
   - Go to SQS service
   - Create standard queue named "sns-dlq"

2. **Configure DLQ in Subscription**
   - Edit subscription
   - Under "Redrive policy"
   - Select your DLQ
   - Set maximum receive count

![DLQ Configuration](screenshots/dlq-config.png)

### Cross-Region Replication

1. **Create Topic in Multiple Regions**
   - Switch to different AWS region
   - Create identical topic
   - Set up cross-region subscriptions

2. **Configure Fan-Out Pattern**
   - SNS topic → Multiple SQS queues
   - Each queue processes messages independently

## 🛡️ Security Best Practices

### Topic Access Policies

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:user/MyUser"
      },
      "Action": "SNS:Publish",
      "Resource": "arn:aws:sns:us-east-1:123456789012:MyTopic",
      "Condition": {
        "StringEquals": {
          "aws:RequestedRegion": "us-east-1"
        }
      }
    }
  ]
}
```

### Encryption Configuration

1. **Server-Side Encryption**
   - Enable KMS encryption
   - Choose AWS managed or customer managed key
   - Configure key policies

2. **Message Attribute Encryption**
   - Encrypt sensitive message attributes
   - Use AWS SDK encryption features

## 💰 Cost Optimization

### Pricing Components
- **Requests**: $0.50 per 1 million requests
- **Email notifications**: $2.00 per 100,000 notifications
- **SMS notifications**: Varies by destination
- **HTTP/HTTPS notifications**: $0.60 per 1 million notifications

### Cost Optimization Tips
- Use message filtering to reduce unnecessary notifications
- Batch messages when possible
- Monitor failed delivery attempts
- Use appropriate delivery retry policies

## 🔍 Troubleshooting Guide

### Common Issues

1. **Subscription Not Confirmed**
   - Check email spam folder
   - Verify email address is correct
   - Resend confirmation if needed

2. **Messages Not Delivered**
   - Check subscription status
   - Verify endpoint accessibility
   - Review delivery status logs

3. **Filter Policy Not Working**
   - Validate JSON syntax
   - Check attribute matching logic
   - Test with simple filter first

### Debugging Steps

1. **Enable Delivery Status Logging**
   - Configure CloudWatch Logs
   - Monitor delivery attempts
   - Analyze failure reasons

2. **Test with Simple Messages**
   - Start with basic text messages
   - Gradually add complexity
   - Verify each step works

## 📊 Monitoring and Alerting

### CloudWatch Integration

1. **Set Up Dashboards**
   - Create custom CloudWatch dashboard
   - Add SNS metrics widgets
   - Monitor key performance indicators

2. **Configure Alarms**
   - Failed delivery rate > threshold
   - Message publish rate anomalies
   - Subscription confirmation failures

### AWS X-Ray Integration

1. **Enable Tracing**
   - Configure X-Ray for SNS
   - Trace message flow
   - Identify performance bottlenecks

## 📚 Integration Examples

### Lambda Integration

```python
import boto3
import json

def lambda_handler(event, context):
    sns = boto3.client('sns')
    
    message = {
        'default': 'Lambda function executed successfully',
        'email': 'Your Lambda function completed processing'
    }
    
    response = sns.publish(
        TopicArn='arn:aws:sns:us-east-1:123456789012:MyTopic',
        Message=json.dumps(message),
        MessageStructure='json',
        MessageAttributes={
            'event_type': {
                'DataType': 'String',
                'StringValue': 'lambda_execution'
            }
        }
    )
    
    return {
        'statusCode': 200,
        'body': json.dumps('Message published successfully')
    }
```

### CloudWatch Alarms Integration

1. **Create Alarm Action**
   - Configure alarm to publish to SNS topic
   - Set up notification for threshold breaches
   - Test alarm functionality

## 🎯 Practice Exercises

1. **Multi-Protocol Notifications**
   - Create topic with email, SMS, and HTTP subscriptions
   - Send messages to all protocols
   - Compare delivery times and formats

2. **Message Filtering Scenarios**
   - Set up complex filter policies
   - Test various message attribute combinations
   - Implement business logic filtering

3. **Error Handling and DLQ**
   - Configure dead letter queue
   - Simulate delivery failures
   - Process messages from DLQ

4. **Cross-Service Integration**
   - Integrate SNS with Lambda, SQS, and CloudWatch
   - Build event-driven architecture
   - Monitor end-to-end message flow

## 📚 Additional Resources

- [SNS Developer Guide](https://docs.aws.amazon.com/sns/)
- [Message Filtering](https://docs.aws.amazon.com/sns/latest/dg/sns-message-filtering.html)
- [Best Practices](https://docs.aws.amazon.com/sns/latest/dg/sns-best-practices.html)
- [API Reference](https://docs.aws.amazon.com/sns/latest/api/)

---

**Next Module:** [CloudWatch →](../CloudWatch/)
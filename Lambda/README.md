# AWS Lambda Workshop ⚡

![Lambda Logo](lambda-logo.png)

## 📋 Overview

AWS Lambda is a serverless compute service that runs code without provisioning or managing servers. This comprehensive module covers creating, deploying, and managing Lambda functions through the AWS Management Console.

## 🎯 Learning Objectives

By the end of this module, you will be able to:
- ✅ Create and deploy Lambda functions using the console
- ✅ Configure triggers and event sources
- ✅ Manage function versions and aliases
- ✅ Set up environment variables and layers
- ✅ Monitor function performance and logs
- ✅ Implement error handling and retry logic
- ✅ Configure VPC and security settings

## 📋 Prerequisites

- AWS Account with Lambda permissions
- Basic programming knowledge (Python, Node.js, Java, etc.)
- Understanding of serverless concepts
- Text editor for code development

## 🚀 Step-by-Step Guide

### Step 1: Access Lambda Console

1. **Navigate to Lambda Console**
   - Sign in to AWS Management Console
   - Search for "Lambda" and select the service
   - Or go to Services → Compute → Lambda

![Lambda Console](screenshots/lambda-console.png)

2. **Lambda Dashboard Overview**
   - View existing functions
   - See recent activity and metrics
   - Access function creation options

![Lambda Dashboard](screenshots/lambda-dashboard.png)

### Step 2: Create Your First Lambda Function

1. **Start Function Creation**
   - Click "Create function" button
   - Choose creation method

![Create Function](screenshots/create-function.png)

2. **Choose Creation Method**
   - **Author from scratch**: Create new function
   - **Use a blueprint**: Start with template
   - **Browse serverless app repository**: Use SAR templates
   - **Container image**: Use container-based function

![Creation Method](screenshots/creation-method.png)

3. **Configure Basic Information**
   - **Function name**: Enter descriptive name (e.g., "MyFirstFunction")
   - **Runtime**: Choose programming language (Python 3.9, Node.js 18.x, etc.)
   - **Architecture**: x86_64 or arm64

![Basic Information](screenshots/basic-information.png)

4. **Configure Permissions**
   - **Execution role**: Choose IAM role for function
   - **Create a new role with basic Lambda permissions**: Default option
   - **Use an existing role**: Select pre-created role
   - **Create a new role from AWS policy templates**: Use templates

![Permissions](screenshots/permissions.png)

5. **Advanced Settings (Optional)**
   - **Enable code signing**: For code integrity
   - **Enable tags**: For resource organization
   - **Enable VPC**: For network access
   - **Enable dead letter queue**: For error handling

![Advanced Settings](screenshots/advanced-settings.png)

6. **Create Function**
   - Review configuration
   - Click "Create function"
   - Function is created and ready for code

![Function Created](screenshots/function-created.png)

### Step 3: Write and Deploy Function Code

1. **Code Editor Interface**
   - Built-in code editor in browser
   - File explorer for multiple files
   - Syntax highlighting and basic IDE features

![Code Editor](screenshots/code-editor.png)

2. **Sample Python Function**
```python
import json
import logging

# Configure logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    """
    AWS Lambda function handler
    
    Args:
        event: Event data passed to the function
        context: Runtime information about the function
    
    Returns:
        dict: Response object with statusCode and body
    """
    
    logger.info(f"Received event: {json.dumps(event)}")
    
    try:
        # Extract data from event
        name = event.get('name', 'World')
        message = f"Hello, {name}!"
        
        # Process the request
        response = {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            'body': json.dumps({
                'message': message,
                'timestamp': context.aws_request_id,
                'function_name': context.function_name,
                'remaining_time': context.get_remaining_time_in_millis()
            })
        }
        
        logger.info(f"Returning response: {response}")
        return response
        
    except Exception as e:
        logger.error(f"Error processing request: {str(e)}")
        return {
            'statusCode': 500,
            'headers': {
                'Content-Type': 'application/json'
            },
            'body': json.dumps({
                'error': 'Internal server error',
                'message': str(e)
            })
        }
```

3. **Sample Node.js Function**
```javascript
const AWS = require('aws-sdk');

exports.handler = async (event, context) => {
    console.log('Received event:', JSON.stringify(event, null, 2));
    
    try {
        const name = event.name || 'World';
        const message = `Hello, ${name}!`;
        
        const response = {
            statusCode: 200,
            headers: {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            body: JSON.stringify({
                message: message,
                requestId: context.awsRequestId,
                functionName: context.functionName,
                remainingTime: context.getRemainingTimeInMillis()
            })
        };
        
        console.log('Returning response:', response);
        return response;
        
    } catch (error) {
        console.error('Error processing request:', error);
        return {
            statusCode: 500,
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                error: 'Internal server error',
                message: error.message
            })
        };
    }
};
```

4. **Deploy Code**
   - Click "Deploy" button to save and deploy changes
   - Code is automatically packaged and deployed
   - Deployment status shown in console

![Deploy Code](screenshots/deploy-code.png)

### Step 4: Test Lambda Function

1. **Create Test Event**
   - Click "Test" button
   - Choose "Create new test event"

![Create Test Event](screenshots/create-test-event.png)

2. **Configure Test Event**
   - **Event template**: Choose from templates or create custom
   - **Event name**: Enter descriptive name
   - **Event JSON**: Define test data

```json
{
  "name": "AWS Lambda Workshop",
  "message": "Testing my first Lambda function",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

![Configure Test Event](screenshots/configure-test-event.png)

3. **Run Test**
   - Click "Test" to execute function
   - View execution results
   - Check logs and performance metrics

![Test Results](screenshots/test-results.png)

4. **Analyze Test Output**
   - **Execution result**: Success or failure
   - **Function logs**: Console output and errors
   - **Request ID**: Unique identifier for execution
   - **Duration**: Execution time
   - **Billed duration**: Rounded up billing time
   - **Memory used**: Actual memory consumption

![Test Output](screenshots/test-output.png)

### Step 5: Configure Function Settings

1. **General Configuration**
   - Click "Configuration" tab
   - Select "General configuration"

![General Configuration](screenshots/general-configuration.png)

2. **Runtime Settings**
   - **Memory**: 128 MB to 10,240 MB
   - **Timeout**: 1 second to 15 minutes
   - **Runtime**: Programming language version
   - **Handler**: Entry point for function
   - **Architecture**: x86_64 or arm64

![Runtime Settings](screenshots/runtime-settings.png)

3. **Environment Variables**
   - Click "Environment variables"
   - Add key-value pairs for configuration

```
DATABASE_URL=postgresql://user:pass@host:5432/db
API_KEY=your-api-key-here
LOG_LEVEL=INFO
REGION=us-east-1
```

![Environment Variables](screenshots/environment-variables.png)

4. **Execution Role**
   - View and modify IAM role
   - Add permissions for AWS services
   - Configure resource access

![Execution Role](screenshots/execution-role.png)

### Step 6: Set Up Triggers

1. **Add Trigger**
   - Click "Add trigger" button
   - Choose trigger source

![Add Trigger](screenshots/add-trigger.png)

2. **API Gateway Trigger**
   - **Trigger**: API Gateway
   - **API type**: REST API or HTTP API
   - **Security**: Open, IAM, or API key
   - **API name**: Enter name for new API

![API Gateway Trigger](screenshots/api-gateway-trigger.png)

3. **S3 Trigger**
   - **Trigger**: S3
   - **Bucket**: Select existing bucket
   - **Event type**: Object created, deleted, etc.
   - **Prefix/Suffix**: Filter by object name patterns

![S3 Trigger](screenshots/s3-trigger.png)

4. **CloudWatch Events Trigger**
   - **Trigger**: EventBridge (CloudWatch Events)
   - **Rule**: Create new or use existing
   - **Schedule expression**: Cron or rate expression
   - **Event pattern**: Match specific events

![CloudWatch Events Trigger](screenshots/cloudwatch-events-trigger.png)

5. **DynamoDB Trigger**
   - **Trigger**: DynamoDB
   - **Table**: Select DynamoDB table
   - **Batch size**: Number of records per invocation
   - **Starting position**: Latest or trim horizon

![DynamoDB Trigger](screenshots/dynamodb-trigger.png)

### Step 7: Monitor Function Performance

1. **CloudWatch Metrics**
   - Click "Monitor" tab
   - View built-in metrics and graphs

![Monitor Tab](screenshots/monitor-tab.png)

2. **Key Metrics**
   - **Invocations**: Number of function executions
   - **Duration**: Average execution time
   - **Errors**: Number of failed executions
   - **Throttles**: Number of throttled invocations
   - **Dead letter errors**: Failed async invocations

![Lambda Metrics](screenshots/lambda-metrics.png)

3. **View Logs**
   - Click "View logs in CloudWatch"
   - Access detailed execution logs
   - Search and filter log events

![CloudWatch Logs](screenshots/cloudwatch-logs.png)

4. **X-Ray Tracing**
   - Enable AWS X-Ray for distributed tracing
   - Analyze function performance
   - Identify bottlenecks and errors

![X-Ray Tracing](screenshots/xray-tracing.png)

### Step 8: Manage Versions and Aliases

1. **Create Version**
   - Click "Actions" → "Publish new version"
   - Add version description
   - Version is immutable snapshot

![Publish Version](screenshots/publish-version.png)

2. **Create Alias**
   - Click "Actions" → "Create alias"
   - **Name**: Alias name (e.g., "PROD", "DEV")
   - **Version**: Point to specific version
   - **Description**: Optional description

![Create Alias](screenshots/create-alias.png)

3. **Weighted Aliases**
   - Split traffic between versions
   - Gradual deployment strategy
   - A/B testing capabilities

![Weighted Aliases](screenshots/weighted-aliases.png)

4. **Version Management**
   - View all versions and aliases
   - Update alias routing
   - Delete old versions

![Version Management](screenshots/version-management.png)

### Step 9: Configure Advanced Features

1. **VPC Configuration**
   - Connect function to VPC
   - Access private resources
   - Configure security groups and subnets

![VPC Configuration](screenshots/vpc-configuration.png)

2. **Dead Letter Queue**
   - Handle failed async invocations
   - Configure SQS or SNS destination
   - Retry and error handling

![Dead Letter Queue](screenshots/dead-letter-queue.png)

3. **Reserved Concurrency**
   - Limit concurrent executions
   - Guarantee capacity
   - Cost control

![Reserved Concurrency](screenshots/reserved-concurrency.png)

4. **Provisioned Concurrency**
   - Pre-warm function instances
   - Reduce cold start latency
   - Consistent performance

![Provisioned Concurrency](screenshots/provisioned-concurrency.png)

### Step 10: Work with Layers

1. **Create Layer**
   - Navigate to "Layers" in Lambda console
   - Click "Create layer"

![Create Layer](screenshots/create-layer.png)

2. **Configure Layer**
   - **Name**: Layer name
   - **Description**: Layer purpose
   - **Upload**: ZIP file or S3 location
   - **Compatible runtimes**: Supported languages
   - **Compatible architectures**: x86_64 or arm64

![Configure Layer](screenshots/configure-layer.png)

3. **Add Layer to Function**
   - In function configuration
   - Click "Layers" section
   - Add custom or AWS-provided layers

![Add Layer](screenshots/add-layer.png)

4. **Layer Use Cases**
   - Shared libraries and dependencies
   - Common utility functions
   - Runtime extensions
   - Monitoring and observability tools

## 🔧 Advanced Lambda Patterns

### Error Handling and Retry Logic

```python
import json
import boto3
from botocore.exceptions import ClientError
import time

def lambda_handler(event, context):
    max_retries = 3
    retry_delay = 1
    
    for attempt in range(max_retries):
        try:
            # Your main logic here
            result = process_event(event)
            return {
                'statusCode': 200,
                'body': json.dumps(result)
            }
        except ClientError as e:
            if attempt < max_retries - 1:
                time.sleep(retry_delay * (2 ** attempt))  # Exponential backoff
                continue
            else:
                # Send to DLQ or handle final failure
                return {
                    'statusCode': 500,
                    'body': json.dumps({'error': str(e)})
                }

def process_event(event):
    # Your processing logic
    pass
```

### Batch Processing Pattern

```python
import json

def lambda_handler(event, context):
    """Process multiple records in batch"""
    
    results = []
    errors = []
    
    # Handle different event sources
    if 'Records' in event:
        records = event['Records']
    else:
        records = [event]  # Single record
    
    for record in records:
        try:
            result = process_record(record)
            results.append(result)
        except Exception as e:
            error_info = {
                'record': record,
                'error': str(e)
            }
            errors.append(error_info)
    
    return {
        'statusCode': 200 if not errors else 207,
        'body': json.dumps({
            'processed': len(results),
            'errors': len(errors),
            'results': results,
            'error_details': errors
        })
    }

def process_record(record):
    # Process individual record
    pass
```

### API Gateway Integration

```python
import json
import boto3
from datetime import datetime

def lambda_handler(event, context):
    """Handle API Gateway requests"""
    
    # Extract HTTP method and path
    http_method = event.get('httpMethod')
    path = event.get('path')
    
    # Parse request body
    body = {}
    if event.get('body'):
        try:
            body = json.loads(event['body'])
        except json.JSONDecodeError:
            return create_response(400, {'error': 'Invalid JSON'})
    
    # Route based on method and path
    if http_method == 'GET' and path == '/health':
        return handle_health_check()
    elif http_method == 'POST' and path == '/process':
        return handle_process_request(body)
    else:
        return create_response(404, {'error': 'Not found'})

def create_response(status_code, body):
    """Create standardized API response"""
    return {
        'statusCode': status_code,
        'headers': {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
        },
        'body': json.dumps(body)
    }

def handle_health_check():
    return create_response(200, {
        'status': 'healthy',
        'timestamp': datetime.utcnow().isoformat()
    })

def handle_process_request(body):
    # Process the request
    result = {'message': 'Processed successfully'}
    return create_response(200, result)
```

## 💰 Cost Optimization

### Pricing Components

- **Requests**: $0.20 per 1M requests
- **Duration**: $0.0000166667 per GB-second
- **Provisioned concurrency**: $0.0000041667 per GB-second
- **Data transfer**: Standard AWS rates

### Optimization Strategies

1. **Memory Optimization**
   - Right-size memory allocation
   - Monitor actual memory usage
   - Balance memory vs. execution time

2. **Execution Time Optimization**
   - Optimize code performance
   - Use connection pooling
   - Implement caching strategies
   - Minimize cold starts

3. **Concurrency Management**
   - Use reserved concurrency wisely
   - Avoid over-provisioning
   - Monitor throttling metrics

### Cost Monitoring

```python
import boto3
import json

def get_lambda_costs():
    """Monitor Lambda costs and usage"""
    
    cloudwatch = boto3.client('cloudwatch')
    
    # Get invocation metrics
    response = cloudwatch.get_metric_statistics(
        Namespace='AWS/Lambda',
        MetricName='Invocations',
        Dimensions=[
            {
                'Name': 'FunctionName',
                'Value': 'MyFunction'
            }
        ],
        StartTime=datetime.utcnow() - timedelta(days=30),
        EndTime=datetime.utcnow(),
        Period=86400,  # Daily
        Statistics=['Sum']
    )
    
    return response['Datapoints']
```

## 🛡️ Security Best Practices

### IAM Permissions

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
      "Resource": "arn:aws:logs:*:*:*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject"
      ],
      "Resource": "arn:aws:s3:::my-bucket/*"
    }
  ]
}
```

### Environment Variable Encryption

1. **Enable Encryption**
   - Use AWS KMS for sensitive data
   - Encrypt at rest and in transit
   - Manage encryption keys properly

2. **Secrets Management**
   - Use AWS Secrets Manager
   - Avoid hardcoding secrets
   - Rotate secrets regularly

```python
import boto3
import json

def get_secret(secret_name):
    """Retrieve secret from AWS Secrets Manager"""
    
    client = boto3.client('secretsmanager')
    
    try:
        response = client.get_secret_value(SecretId=secret_name)
        return json.loads(response['SecretString'])
    except Exception as e:
        print(f"Error retrieving secret: {e}")
        return None
```

### VPC Security

1. **Network Isolation**
   - Use private subnets
   - Configure security groups
   - Implement NACLs
   - Use VPC endpoints

2. **Access Control**
   - Principle of least privilege
   - Resource-based policies
   - Cross-account access controls

## 🔍 Troubleshooting Guide

### Common Issues

1. **Cold Start Performance**
   - Use provisioned concurrency
   - Optimize initialization code
   - Choose appropriate runtime
   - Implement connection pooling

2. **Memory and Timeout Issues**
   - Monitor memory usage
   - Optimize code performance
   - Increase timeout if needed
   - Profile function execution

3. **Permission Errors**
   - Check IAM role permissions
   - Verify resource policies
   - Test with AWS CLI
   - Review CloudTrail logs

### Debugging Techniques

1. **Logging Best Practices**
```python
import logging
import json

# Configure structured logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info(json.dumps({
        'event': 'function_start',
        'request_id': context.aws_request_id,
        'function_name': context.function_name
    }))
    
    try:
        # Your logic here
        result = process_event(event)
        
        logger.info(json.dumps({
            'event': 'function_success',
            'request_id': context.aws_request_id,
            'result': result
        }))
        
        return result
        
    except Exception as e:
        logger.error(json.dumps({
            'event': 'function_error',
            'request_id': context.aws_request_id,
            'error': str(e),
            'error_type': type(e).__name__
        }))
        raise
```

2. **Local Testing**
   - Use AWS SAM CLI
   - Docker containers
   - Local development tools
   - Unit testing frameworks

## 🎯 Practice Exercises

### Exercise 1: Basic CRUD API
1. Create Lambda function for user management
2. Set up API Gateway integration
3. Implement GET, POST, PUT, DELETE operations
4. Add input validation and error handling

### Exercise 2: Event-Driven Processing
1. Create S3 trigger for file processing
2. Process uploaded images or documents
3. Store results in DynamoDB
4. Send notifications via SNS

### Exercise 3: Scheduled Tasks
1. Create CloudWatch Events trigger
2. Implement data backup function
3. Generate daily reports
4. Clean up old resources

### Exercise 4: Multi-Service Integration
1. Create workflow with multiple Lambda functions
2. Use Step Functions for orchestration
3. Implement error handling and retries
4. Monitor end-to-end performance

## 📚 Additional Resources

- [AWS Lambda Developer Guide](https://docs.aws.amazon.com/lambda/)
- [Lambda Best Practices](https://docs.aws.amazon.com/lambda/latest/dg/best-practices.html)
- [Serverless Application Model (SAM)](https://aws.amazon.com/serverless/sam/)
- [Lambda Powertools](https://awslabs.github.io/aws-lambda-powertools/)

---

**Workshop Complete!** 🎉 You've now learned all the major AWS services covered in this workshop.
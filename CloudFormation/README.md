# AWS CloudFormation Workshop 🏗️

![CloudFormation Logo](cloudformation-logo.png)

## 📋 Overview

AWS CloudFormation is an Infrastructure as Code (IaC) service that allows you to model and provision AWS resources using templates. This module will guide you through creating, deploying, and managing CloudFormation stacks using the AWS Management Console.

## 🎯 Learning Objectives

By the end of this module, you will be able to:
- ✅ Create CloudFormation templates
- ✅ Deploy stacks using the AWS Console
- ✅ Monitor stack events and resources
- ✅ Update and delete stacks
- ✅ Use CloudFormation Designer

## 📋 Prerequisites

- AWS Account with appropriate permissions
- Basic understanding of AWS services (EC2, S3, IAM)
- Text editor for template creation

## 🚀 Step-by-Step Guide

### Step 1: Access CloudFormation Console

1. **Sign in to AWS Management Console**
   - Navigate to [AWS Console](https://console.aws.amazon.com)
   - Enter your credentials

2. **Open CloudFormation Service**
   - In the search bar, type "CloudFormation"
   - Click on "CloudFormation" from the dropdown
   - Or navigate to Services → Management & Governance → CloudFormation

![CloudFormation Console](screenshots/cf-console.png)

### Step 2: Create Your First Stack

1. **Click "Create stack"**
   - On the CloudFormation dashboard, click "Create stack"
   - Select "With new resources (standard)"

![Create Stack](screenshots/create-stack.png)

2. **Choose Template Source**
   - Select "Template is ready"
   - Choose "Upload a template file"
   - Click "Choose file" and upload your template
   - Or select "Amazon S3 URL" if template is stored in S3

![Template Source](screenshots/template-source.png)

3. **Specify Stack Details**
   - **Stack name**: Enter a unique name (e.g., "my-first-stack")
   - **Parameters**: Fill in any required parameters
   - Review parameter descriptions and constraints

![Stack Details](screenshots/stack-details.png)

4. **Configure Stack Options**
   - **Tags**: Add key-value pairs for organization
   - **Permissions**: Choose IAM role (optional)
   - **Stack policy**: Define update permissions (optional)
   - **Rollback configuration**: Set failure handling
   - **Notification options**: Configure SNS topics
   - **Timeouts**: Set stack creation timeout

![Stack Options](screenshots/stack-options.png)

5. **Review and Create**
   - Review all configurations
   - Check "I acknowledge that AWS CloudFormation might create IAM resources"
   - Click "Create stack"

![Review Stack](screenshots/review-stack.png)

### Step 3: Monitor Stack Creation

1. **View Stack Events**
   - Click on your stack name
   - Navigate to "Events" tab
   - Monitor real-time creation progress
   - Check for any errors or warnings

![Stack Events](screenshots/stack-events.png)

2. **Check Resources**
   - Click "Resources" tab
   - View all resources being created
   - Check resource status and physical IDs

![Stack Resources](screenshots/stack-resources.png)

3. **View Outputs**
   - Click "Outputs" tab
   - See any output values defined in template
   - Copy important values like URLs or IDs

![Stack Outputs](screenshots/stack-outputs.png)

### Step 4: Update Stack

1. **Select Stack to Update**
   - Choose your stack from the list
   - Click "Update"

![Update Stack](screenshots/update-stack.png)

2. **Choose Update Method**
   - **Use current template**: Keep existing template
   - **Replace current template**: Upload new version
   - **Use a sample template**: Select AWS sample

3. **Review Changes**
   - CloudFormation shows change preview
   - Review additions, modifications, deletions
   - Check replacement requirements

![Change Preview](screenshots/change-preview.png)

### Step 5: Delete Stack

1. **Select Stack**
   - Choose stack to delete
   - Click "Delete"

2. **Confirm Deletion**
   - Type stack name to confirm
   - Click "Delete stack"

![Delete Stack](screenshots/delete-stack.png)

## 📝 Sample Templates

### Basic EC2 Instance Template

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Description: 'Basic EC2 instance with security group'

Parameters:
  InstanceType:
    Type: String
    Default: t2.micro
    AllowedValues: [t2.micro, t2.small, t2.medium]
    Description: EC2 instance type

Resources:
  MySecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: Security group for EC2 instance
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: 22
          ToPort: 22
          CidrIp: 0.0.0.0/0

  MyEC2Instance:
    Type: AWS::EC2::Instance
    Properties:
      ImageId: ami-0abcdef1234567890
      InstanceType: !Ref InstanceType
      SecurityGroupIds:
        - !Ref MySecurityGroup

Outputs:
  InstanceId:
    Description: Instance ID
    Value: !Ref MyEC2Instance
  PublicIP:
    Description: Public IP address
    Value: !GetAtt MyEC2Instance.PublicIp
```

### S3 Bucket with Website Configuration

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Description: 'S3 bucket configured for static website hosting'

Parameters:
  BucketName:
    Type: String
    Description: Name for the S3 bucket

Resources:
  WebsiteBucket:
    Type: AWS::S3::Bucket
    Properties:
      BucketName: !Ref BucketName
      WebsiteConfiguration:
        IndexDocument: index.html
        ErrorDocument: error.html
      PublicAccessBlockConfiguration:
        BlockPublicAcls: false
        BlockPublicPolicy: false
        IgnorePublicAcls: false
        RestrictPublicBuckets: false

  BucketPolicy:
    Type: AWS::S3::BucketPolicy
    Properties:
      Bucket: !Ref WebsiteBucket
      PolicyDocument:
        Statement:
          - Effect: Allow
            Principal: '*'
            Action: s3:GetObject
            Resource: !Sub '${WebsiteBucket}/*'

Outputs:
  WebsiteURL:
    Description: Website URL
    Value: !GetAtt WebsiteBucket.WebsiteURL
```

## 🎨 Using CloudFormation Designer

### Step 1: Access Designer

1. **Open Designer**
   - In CloudFormation console, click "Designer"
   - Or go to CloudFormation → Designer

![Designer Access](screenshots/designer-access.png)

### Step 2: Create Visual Template

1. **Drag and Drop Resources**
   - From resource types panel, drag resources to canvas
   - Connect resources by dragging from one to another

![Designer Canvas](screenshots/designer-canvas.png)

2. **Configure Properties**
   - Click on resource to select
   - Edit properties in the bottom panel
   - Set parameters and references

3. **Validate Template**
   - Click "Validate template" button
   - Fix any syntax errors
   - Review template in JSON/YAML tabs

### Step 3: Deploy from Designer

1. **Create Stack**
   - Click "Create stack" icon
   - Follow standard stack creation process
   - Template is automatically populated

## 🔍 Monitoring and Troubleshooting

### CloudFormation Events

1. **Event Types**
   - CREATE_IN_PROGRESS
   - CREATE_COMPLETE
   - CREATE_FAILED
   - UPDATE_IN_PROGRESS
   - DELETE_IN_PROGRESS

2. **Common Error Messages**
   - Resource limit exceeded
   - Insufficient permissions
   - Resource already exists
   - Invalid parameter values

### Stack Policies

```json
{
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "Update:*",
      "Resource": "*"
    },
    {
      "Effect": "Deny",
      "Principal": "*",
      "Action": "Update:Delete",
      "Resource": "LogicalResourceId/ProductionDatabase"
    }
  ]
}
```

## 💰 Cost Considerations

- CloudFormation service itself is free
- You pay for AWS resources created by stacks
- Use AWS Cost Explorer to monitor stack costs
- Tag resources for cost allocation

## 🛡️ Security Best Practices

- Use IAM roles for CloudFormation service
- Implement least privilege access
- Enable CloudTrail for API logging
- Use stack policies for protection
- Validate templates before deployment

## 🔧 Troubleshooting Guide

### Common Issues

1. **Stack Creation Failed**
   - Check Events tab for error details
   - Verify IAM permissions
   - Check resource limits and quotas

2. **Template Validation Errors**
   - Use CloudFormation Linter (cfn-lint)
   - Check JSON/YAML syntax
   - Verify resource property names

3. **Resource Dependencies**
   - Use DependsOn attribute when needed
   - Check implicit dependencies
   - Review resource creation order

## 📚 Additional Resources

- [CloudFormation User Guide](https://docs.aws.amazon.com/cloudformation/)
- [Template Reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-reference.html)
- [Best Practices](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/best-practices.html)
- [Sample Templates](https://aws.amazon.com/cloudformation/templates/)

## 🎯 Practice Exercises

1. Create a stack with VPC and subnets
2. Deploy a multi-tier application
3. Use nested stacks for complex architectures
4. Implement cross-stack references
5. Create custom resources with Lambda

---

**Next Module:** [SNS (Simple Notification Service) →](../SNS/)
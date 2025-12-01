# AWS Cloud Workshop 🚀

Welcome to the AWS Cloud Workshop! This hands-on workshop introduces you to three fundamental AWS services: **EC2**, **S3**, and **Lambda**. Each module includes step-by-step guides, practical examples, and visual aids to help you get started with AWS cloud computing.

![AWS Services](EC2/AWS.png)

## 📚 Workshop Overview

This workshop is designed for beginners who want to learn AWS cloud fundamentals through practical, hands-on experience. You'll learn to:

- Launch and manage virtual servers with **Amazon EC2**
- Store and serve static websites with **Amazon S3**
- Build serverless functions with **AWS Lambda**

## 🎯 Learning Objectives

By the end of this workshop, you will be able to:
- ✅ Launch and connect to EC2 instances
- ✅ Create and configure S3 buckets for static website hosting
- ✅ Deploy and test Lambda functions
- ✅ Understand basic AWS security and networking concepts
- ✅ Navigate the AWS Management Console confidently

## 📋 Prerequisites

- AWS Account (Free Tier eligible)
- Basic understanding of cloud computing concepts
- Terminal/Command Line familiarity (for EC2 SSH)
- Text editor for code editing

## 🏗️ Workshop Modules

### 1. Amazon EC2 (Elastic Compute Cloud) 💻

**What you'll learn:** Launch virtual servers in the cloud, configure security groups, and connect via SSH.

**Practical Exercise:** Deploy a web server with encrypted storage and custom user data script.

**Key Concepts:**
- Virtual Machine instances
- AMI (Amazon Machine Images)
- Security Groups & Key Pairs
- SSH connectivity
- EBS encryption

📁 **[Go to EC2 Module →](./EC2/)**

---

### 2. Amazon S3 (Simple Storage Service) 🗄️

**What you'll learn:** Create storage buckets, upload files, and host static websites.

**Practical Exercise:** Build and deploy a static website using S3 bucket hosting.

**Key Concepts:**
- Object storage
- Bucket policies
- Static website hosting
- Public access configuration
- Web endpoint URLs

📁 **[Go to S3 Module →](./S3/)**

---

### 3. AWS Lambda (Serverless Computing) ⚡

**What you'll learn:** Create serverless functions, handle events, and process data without managing servers.

**Practical Exercise:** Deploy a Python function that processes JSON data and returns calculated results.

**Key Concepts:**
- Serverless architecture
- Event-driven computing
- Function handlers
- Runtime environments
- CloudWatch integration

📁 **[Go to Lambda Module →](./Lambda/)**

---

### 4. AWS CloudFormation (Infrastructure as Code) 🏗️

**What you'll learn:** Model and provision AWS resources using templates, manage infrastructure as code.

**Practical Exercise:** Create and deploy CloudFormation stacks with EC2 instances and S3 buckets.

**Key Concepts:**
- Infrastructure as Code (IaC)
- CloudFormation templates
- Stack management
- Resource dependencies
- CloudFormation Designer

📁 **[Go to CloudFormation Module →](./CloudFormation/)**

---

### 5. Amazon SNS (Simple Notification Service) 📧

**What you'll learn:** Set up pub/sub messaging, configure notifications, and integrate with other services.

**Practical Exercise:** Create topics, subscriptions, and send notifications via email, SMS, and HTTP.

**Key Concepts:**
- Pub/Sub messaging
- Topics and subscriptions
- Message filtering
- Multi-protocol delivery
- Integration patterns

📁 **[Go to SNS Module →](./SNS/)**

---

### 6. Amazon CloudWatch (Monitoring & Observability) 📊

**What you'll learn:** Monitor AWS resources, create dashboards, and analyze performance metrics.

**Practical Exercise:** Build comprehensive monitoring dashboards and set up log analysis.

**Key Concepts:**
- Metrics and monitoring
- Custom dashboards
- Log management
- Performance analysis
- CloudWatch Insights

📁 **[Go to CloudWatch Module →](./CloudWatch/)**

---

### 7. CloudWatch Alarms (Automated Alerting) 🚨

**What you'll learn:** Create intelligent alarms, configure notifications, and implement automated responses.

**Practical Exercise:** Set up threshold-based and anomaly detection alarms with automated actions.

**Key Concepts:**
- Threshold monitoring
- Anomaly detection
- Composite alarms
- Automated actions
- Notification strategies

📁 **[Go to CloudWatch Alarms Module →](./Alarms/)**

---

### 8. CloudWatch Log Groups (Centralized Logging) 📝

**What you'll learn:** Manage log groups, configure retention, and analyze logs with advanced queries.

**Practical Exercise:** Set up centralized logging, create metric filters, and use Logs Insights.

**Key Concepts:**
- Log aggregation
- Retention policies
- Metric extraction
- Log analysis
- Subscription filters

📁 **[Go to CloudWatch Log Groups Module →](./LogGroup/)**

## 🚀 Quick Start Guide

### Step 1: Set Up Your AWS Account
1. Sign up for AWS Free Tier at [aws.amazon.com](https://aws.amazon.com)
2. Complete account verification
3. Sign in to AWS Management Console

### Step 2: Choose Your Learning Path
- **Beginner:** Start with S3 → EC2 → Lambda
- **Intermediate:** Jump to any module based on your interests
- **Complete Workshop:** Follow all modules in sequence

### Step 3: Follow Module Instructions
Each module contains:
- Detailed step-by-step instructions
- Screenshots for visual guidance
- Code examples and configurations
- Troubleshooting tips

## 📖 Additional AWS Learning Resources

### Official AWS Documentation
- [AWS Getting Started Guide](https://aws.amazon.com/getting-started/)
- [AWS Free Tier](https://aws.amazon.com/free/)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)

### AWS Training & Certification
- [AWS Skill Builder](https://skillbuilder.aws/) - Free digital training
- [AWS Cloud Practitioner Essentials](https://aws.amazon.com/training/course-descriptions/cloud-practitioner-essentials/)
- [AWS Certified Cloud Practitioner](https://aws.amazon.com/certification/certified-cloud-practitioner/)

### Hands-on Labs & Tutorials
- [AWS Hands-on Tutorials](https://aws.amazon.com/getting-started/hands-on/)
- [AWS Workshops](https://workshops.aws/)
- [AWS Architecture Center](https://aws.amazon.com/architecture/)

## 🛡️ Security Best Practices

Throughout this workshop, we emphasize AWS security best practices:

- **Principle of Least Privilege:** Grant minimal necessary permissions
- **Encryption:** Use encryption for data at rest and in transit
- **Access Control:** Implement proper IAM policies and security groups
- **Monitoring:** Enable CloudTrail and CloudWatch for auditing
- **Cost Management:** Monitor usage to avoid unexpected charges

## 💰 Cost Considerations

This workshop is designed to use AWS Free Tier resources:

- **EC2:** t2.micro instances (750 hours/month free)
- **S3:** 5GB storage, 20,000 GET requests (12 months free)
- **Lambda:** 1M free requests per month, 400,000 GB-seconds compute time

⚠️ **Important:** Always clean up resources after completing exercises to avoid charges.

## 🔧 Troubleshooting

### Common Issues & Solutions

**EC2 Connection Problems:**
- Verify security group allows SSH (port 22)
- Check key pair permissions (`chmod 400 key.pem`)
- Ensure correct username for AMI type

**S3 Website Not Loading:**
- Confirm bucket policy allows public read access
- Verify static website hosting is enabled
- Check index.html file exists and is properly named

**Lambda Function Errors:**
- Review CloudWatch logs for error details
- Verify function timeout settings
- Check IAM permissions for required services

## 🤝 Contributing

Found an issue or want to improve the workshop? Contributions are welcome!

1. Fork the repository
2. Create a feature branch
3. Make your improvements
4. Submit a pull request

## 📞 Support

If you encounter issues during the workshop:

1. Check the troubleshooting section in each module
2. Review AWS documentation links provided
3. Search AWS forums and Stack Overflow
4. Contact AWS Support (if you have a support plan)

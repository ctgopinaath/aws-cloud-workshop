#!/bin/bash

# AWS Cloud Workshop Setup Script
# This script helps you prepare for the AWS Cloud Workshop

echo "🚀 AWS Cloud Workshop Setup"
echo "=========================="
echo ""

# Check if AWS CLI is installed
if command -v aws &> /dev/null; then
    echo "✅ AWS CLI is installed"
    aws --version
else
    echo "❌ AWS CLI not found"
    echo "📥 Install AWS CLI: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html"
fi

echo ""

# Check AWS credentials
if aws sts get-caller-identity &> /dev/null; then
    echo "✅ AWS credentials configured"
    echo "Account ID: $(aws sts get-caller-identity --query Account --output text)"
    echo "Region: $(aws configure get region)"
else
    echo "❌ AWS credentials not configured"
    echo "🔧 Run: aws configure"
    echo "📖 Guide: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html"
fi

echo ""

# Check default region
DEFAULT_REGION=$(aws configure get region)
if [ -z "$DEFAULT_REGION" ]; then
    echo "⚠️  No default region set"
    echo "🔧 Recommended: aws configure set region us-east-1"
else
    echo "✅ Default region: $DEFAULT_REGION"
fi

echo ""

# Workshop modules overview
echo "📚 Available Workshop Modules:"
echo "1. EC2 (Elastic Compute Cloud) - Virtual servers"
echo "2. S3 (Simple Storage Service) - Object storage"
echo "3. Lambda - Serverless computing"
echo "4. CloudFormation - Infrastructure as Code"
echo "5. SNS (Simple Notification Service) - Messaging"
echo "6. CloudWatch - Monitoring and observability"
echo "7. CloudWatch Alarms - Automated alerting"
echo "8. CloudWatch Log Groups - Centralized logging"

echo ""

# Recommended starting points
echo "🎯 Recommended Starting Points:"
echo "• Beginners: Start with S3 → EC2 → Lambda"
echo "• Infrastructure focus: EC2 → CloudFormation → CloudWatch"
echo "• Serverless focus: Lambda → SNS → CloudWatch Log Groups"

echo ""

# Cost reminder
echo "💰 Cost Information:"
echo "• All exercises use AWS Free Tier resources"
echo "• Estimated cost: $0 (within Free Tier limits)"
echo "• Remember to clean up resources after each module"

echo ""

# Next steps
echo "🚀 Next Steps:"
echo "1. Choose your learning path from WORKSHOP_INDEX.md"
echo "2. Navigate to your first module directory"
echo "3. Follow the step-by-step README guide"
echo "4. Complete hands-on exercises"

echo ""
echo "Happy learning! 🎉"
echo ""
echo "Need help? Check the troubleshooting section in each module's README"
echo "Documentation: https://docs.aws.amazon.com/"
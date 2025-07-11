## Step-by-Step Process in AWS Management Console

### 1. Navigate to Lambda Service
• Sign in to AWS Management Console
• Search for "Lambda" in the services search bar
• Click on "Lambda" to open the Lambda console

### 2. Create Function
• Click "Create function"
• Select "Author from scratch" (recommended for custom Python code)
• **Function name**: Enter a name (e.g., "my-python-function")
• **Runtime**: Select "Python 3.11" (or latest available Python version)
• **Architecture**: Choose x86_64 or arm64
• Leave "Permissions" as default for now
• Click "Create function"

### 3. Write Your Python Code
• In the "Code source" section, you'll see the default lambda_function.py
• Replace the default code with your Python code
• **Example Python code: lambda_function.py

### 4. Configure Function Settings
• **Timeout**: Go to "Configuration" → "General configuration" → "Edit"
  • Set timeout (default is 3 seconds, max is 15 minutes)
• **Memory**: Adjust memory allocation (128 MB to 10,240 MB)
• **Environment variables**: Add if needed in "Configuration" → "Environment variables"

### 5. Deploy Your Code
• Click "Deploy" button to save your changes
• Wait for the "Changes deployed" confirmation

### 6. Test Your Function
• Click "Test" button
• **Create new test event**:
  • **Event name**: Enter a name (e.g., "test-event")
  • **Event JSON**: Enter test data

json
{
  "name": "AWS Lambda",
  "numbers": [10, 20, 30, 40, 50]
}


• Click "Create"
• Click "Test" to execute
• View results in the "Execution results" section


## Key Points:
• Lambda functions must have a handler function (default: lambda_handler)
• The event parameter contains input data
• The context parameter contains runtime information
• Always return a properly formatted response
• Use CloudWatch Logs for debugging
• Consider cold start times for performance optimization

Your Lambda function will be ready to execute Python code once deployed and can be triggered manually or through various AWS 
services!
import json

def lambda_handler(event, context):
    # Your Python code goes here
    print("Hello from Lambda!")
    
    # Example: Process input data
    name = event.get('name', 'World')
    message = f"Hello, {name}!"
    
    # Example: Perform some calculations
    numbers = event.get('numbers', [1, 2, 3, 4, 5])
    total = sum(numbers)
    
    # Return response
    return {
        'statusCode': 200,
        'body': json.dumps({
            'message': message,
            'sum': total,
            'processed_numbers': numbers
        })
    }
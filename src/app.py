from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from my AWS Homelab"

if __name__ == '__main__':
    # Start the Flask development server with debug mode enabled
    # Debug mode allows auto-reloading when code changes and provides detailed error messages
    app.run(debug=True)
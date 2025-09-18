from flask import Flask, request, jsonify
import numpy as np
import pandas as pd
from sklearn.ensemble import IsolationForest
import joblib

app = Flask(__name__)

# Load a pre-trained model
# In a real-world scenario, you would train this model on historical data.
try:
    model = joblib.load('anomaly_model.pkl')
except FileNotFoundError:
    # If the model doesn't exist, create a simple one for demonstration
    print("Pre-trained model not found. Creating a new one for demonstration purposes.")
    model = IsolationForest(random_state=42)
    # You would train this on a dataset here. For now, we'll create a dummy dataset.
    X = np.random.randn(100, 2)
    model.fit(X)
    joblib.dump(model, 'anomaly_model.pkl')

@app.route('/api/v1/anomaly-detection', methods=['POST'])
def detect_anomaly():
    try:
        # Get data from the Node.js backend
        data = request.json['data']

        # Preprocess the data for the model
        df = pd.DataFrame(data)
        if 'location' not in df.columns or 'coordinates' not in df['location'].iloc[0]:
            return jsonify({'error': 'Invalid data format. Expected a list of location objects with coordinates.'}), 400

        # Extract latitude and longitude
        coords = np.array([d['location']['coordinates'] for d in data])
        # The model expects a 2D array, so we use latitude and longitude.
        input_data = coords[:, [1, 0]] # [lat, lon]

        # Use the pre-trained model to predict if the data points are anomalies
        predictions = model.predict(input_data)
        
        # Convert predictions to a readable format
        is_anomaly = [True if p == -1 else False for p in predictions]
        
        # You might also want to include the anomaly score
        anomaly_scores = model.decision_function(input_data).tolist()

        response = {
            "status": "success",
            "message": "Anomaly detection complete.",
            "results": {
                "anomalies": is_anomaly,
                "scores": anomaly_scores
            }
        }
        return jsonify(response), 200

    except Exception as e:
        return jsonify({'status': 'error', 'message': str(e)}), 500

if __name__ == '__main__':
    # Running the service on a specific port, e.g., 5000, as referenced in aiController.js
    app.run(port=5000)

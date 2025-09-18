from flask import Flask, request, jsonify
from transformers import pipeline

app = Flask(__name__)

# Load a pre-trained sentiment analysis pipeline from Hugging Face.
# In a real-world scenario, you would fine-tune a model on your specific report data.
# This example uses a zero-shot classification model, which is versatile and can classify text
# without being explicitly trained on the provided labels.
try:
    classifier = pipeline("zero-shot-classification", model="facebook/bart-large-mnli")
except Exception as e:
    print(f"Error loading Hugging Face model: {e}")
    # You might want to handle this more gracefully in a production environment
    classifier = None

@app.route('/api/v1/report-classification', methods=['POST'])
def classify_report():
    if not classifier:
        return jsonify({'status': 'error', 'message': 'Model not loaded.'}), 503

    try:
        # Get the report text from the Node.js backend.
        report_text = request.json.get('text')
        if not report_text:
            return jsonify({'error': 'No text provided for classification.'}), 400

        # Define the possible labels for report classification.
        # These labels should be tailored to the types of incidents you expect.
        candidate_labels = [
            "theft",
            "medical emergency",
            "harassment",
            "lost item",
            "traffic incident",
            "natural disaster",
            "scam",
            "assault"
        ]

        # Use the classifier to classify the report text.
        classification = classifier(report_text, candidate_labels)

        # The classification result is a dictionary with labels and their confidence scores.
        response = {
            "status": "success",
            "message": "Report classification complete.",
            "results": {
                "sequence": classification['sequence'],
                "labels": classification['labels'],
                "scores": classification['scores']
            }
        }
        return jsonify(response), 200

    except Exception as e:
        return jsonify({'status': 'error', 'message': str(e)}), 500

if __name__ == '__main__':
    # Running the service on a specific port, e.g., 5000, as referenced in aiController.js
    app.run(port=5000)

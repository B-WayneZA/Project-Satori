import cv2
import torch
import os
import base64
import json
from io import BytesIO
from PIL import Image

# Load model directly
from transformers import AutoImageProcessor, AutoModelForImageClassification

processor = AutoImageProcessor.from_pretrained("./models/vit_deepfashion/")
model = AutoModelForImageClassification.from_pretrained("./models/vit_deepfashion/")

def segment_clothing(image_path):
   """
   Segments clothing items from an image using the DeepFashion Hugging Face model.
   Args:
      image_path (str): Path to the input image.
   Returns:
      dict: Classification results with labels and confidence scores.
   """

   # Load the model
   image = Image.open(image_path)
   inputs = processor(images=image, return_tensors="pt")

    # Perform inference
   with torch.no_grad():
      outputs = model(**inputs)

   # Get predictions
   logits = outputs.logits
   probabilities = torch.softmax(logits, dim=1)
   top_predictions = torch.topk(probabilities, k=5)

   # Map predicted indices to labels
   predicted_indices = top_predictions.indices[0].tolist()
   predicted_probs = top_predictions.values[0].tolist()
   predicted_labels = [model.config.id2label[idx] for idx in predicted_indices]

  # Simulate bounding boxes (for demonstration purposes)
   # Replace this with actual mask/bounding box logic from a segmentation model
   width, height = image.size
   mock_bboxes = [
      (0, 0, width // 2, height // 2),  # Example bounding boxes
      (width // 2, 0, width, height // 2),
      (0, height // 2, width // 2, height)
   ]

   # Extract individual clothing items as images
   clothing_items = []
   for i, bbox in enumerate(mock_bboxes):
      cropped_image = image.crop(bbox)
      buffer = BytesIO()
      cropped_image.save(buffer, format="JPEG")
      encoded_image = base64.b64encode(buffer.getvalue()).decode("utf-8")
      clothing_items.append({
         "label": predicted_labels[i % len(predicted_labels)],
         "probability": predicted_probs[i % len(predicted_probs)],
         "image": encoded_image
      })

   # Package results into a JSON-like structure
   results = {"clothing_items": clothing_items}
   return results

# Example usage
if __name__ == "__main__":
   image_path = "path_to_image.jpg"
   results = segment_clothing(image_path)

   # Save the JSON to a file or send it as a response
   with open("clothing_segments.json", "w") as json_file:
      json.dump(results, json_file, indent=4)

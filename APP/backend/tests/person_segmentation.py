import unittest
import os
import cv2
from modules.person_segment import load_model, segment_person

class TestPersonSegmentation(unittest.TestCase):
    def setUp(self):
        # Load the model predictor once for efficiency
        self.predictor = load_model()

    def visualize_and_save_result(self, image, masks, test_name):
        """
        Overlays the segmentation mask on the original image, visualizes, and saves the result.
        """
        if image is None or masks is None:
            raise ValueError("Image or masks is None!")

        # Create a blank overlay
        overlay = image.copy()

        # Apply masks on the image
        for mask in masks:
            # Color the mask with a semi-transparent overlay
            overlay[mask > 0] = [0, 0, 255]  # Green for the mask

        # Blend the overlay with the original image
        segmented_image = cv2.addWeighted(image, 0.7, overlay, 0.3, 0)

     
       
        # Save the result
        output_path = f"output/{test_name}_segmented.png"
        os.makedirs("output", exist_ok=True)
        cv2.imwrite(output_path, segmented_image)
        print(f"Segmented image saved at: {output_path}")

    def test_simple_scene(self):
        masks, boxes, image = segment_person("C:/Users/LeboM/.vscode/Project-Satori/APP/backend/tests/test_images/test_img1.png", self.predictor)
        self.assertGreater(len(masks), 0, "No person detected in a simple scene.")
        
        # Visualize and save
        self.visualize_and_save_result(image, masks, "test_simple_scene")

    def test_complex_scene(self):
        masks, boxes, image = segment_person("C:/Users/LeboM/.vscode/Project-Satori/APP/backend/tests/test_images/test_img2.jpg", self.predictor)
        self.assertGreaterEqual(len(masks), 1, "At least one person should be detected in a complex scene.")

        # Visualize and save
        self.visualize_and_save_result(image, masks, "test_complex_scene")

    def test_edge_case(self):
        masks, boxes, image = segment_person("C:/Users/LeboM/.vscode/Project-Satori/APP/backend/tests/test_images/test_img5.jpg", self.predictor)
        self.assertGreaterEqual(len(masks), 0, "Should handle edge cases gracefully without errors.")

        # Visualize and save
        self.visualize_and_save_result(image, masks, "test_edge_case")


if __name__ == "__main__":
    unittest.main()

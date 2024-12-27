import json
import unittest
import os
import cv2
from modules.clothing_segment import segment_clothing

class TestClothingSegmentation(unittest.TestCase):
   def test_simple_scene(self):
      results = segment_clothing("C:/Users/LeboM/.vscode/Project-Satori/APP/backend/output/test_simple_scene_segmented.png")
        # Save the JSON to a file or send it as a response
      with open("clothing_segments_simple.json", "w") as json_file:
         json.dump(results, json_file, indent=4)

   def test_complex_scene(self):
      results = segment_clothing("C:/Users/LeboM/.vscode/Project-Satori/APP/backend/output/test_complex_scene_segmented.png")
      # Save the JSON to a file or send it as a response
      with open("clothing_segments_complex.json", "w") as json_file:
         json.dump(results, json_file, indent=4)

   def test_color_grading(self):
      results = segment_clothing("C:/Users/LeboM/.vscode/Project-Satori/APP/backend/output/test_edge_case_segmented.png")
      # Save the JSON to a file or send it as a response
      with open("clothing_segments_edge.json", "w") as json_file:
         json.dump(results, json_file, indent=4)


if __name__ == "__main__":
    unittest.main()

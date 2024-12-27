import cv2
import torch
import os
import numpy as np
from detectron2.engine import DefaultPredictor
from detectron2.config import get_cfg
from detectron2.utils.visualizer import Visualizer
from detectron2.data import MetadataCatalog
from detectron2.utils.file_io import PathManager


def load_model():
    # Load configuration
    cfg = get_cfg()
    # Use os.path to create the correct path
    base_path = os.path.abspath("../backend/models/configs/")
    config_path = os.path.join(base_path, "mask_rcnn_R_50_FPN_3x.yaml")

    # Merge configuration file
    cfg.merge_from_file(config_path)    

    cfg.MODEL.WEIGHTS = "../backend/models/mask_rcnn/mask_rcnn_coco.pkl"
    cfg.MODEL.ROI_HEADS.SCORE_THRESH_TEST = 0.5
    cfg.MODEL.DEVICE = "cpu"

    return DefaultPredictor(cfg)

def segment_person(image_path, predictor):
    # Read image
    image = cv2.imread(image_path)
    if image is None:
        print("Error: unable to read image")
        return None
    
    outputs = predictor(image)
    instances = outputs["instances"]
    
    person_class_id = 0
    person_indices = instances.pred_classes == person_class_id
    masks = instances.pred_masks[person_indices]

    if len(masks) == 0:
        raise ValueError("No person detected in the image.")

    # Combine all person masks into a single mask
    combined_mask = np.any(masks.numpy(), axis=0).astype(np.uint8) * 255

    # Create a transparent background
    transparent_background = np.zeros_like(image, dtype=np.uint8)

    # Apply the mask to the original image
    person_with_background_removed = cv2.bitwise_and(image, image, mask=combined_mask)

    # Overlay the masked person onto the transparent background
    result_image = np.where(combined_mask[..., None] == 255, person_with_background_removed, transparent_background)
    masks = instances.pred_masks.cpu().numpy()
    boxes = instances.pred_boxes.tensor.cpu().numpy()
    return masks, boxes, result_image

def visualize_results(image, masks, boxes, output_path="results/output.jpg"):
    from detectron2.utils.visualizer import GenericMask
    import numpy as np

    for i, mask in enumerate(masks):
        mask_instance = GenericMask(mask, image.shape[0], image.shape[1])
        image = mask_instance.draw(image)

    for box in boxes:
        x1, y1, x2, y2 = box.astype(int)
        cv2.rectangle(image, (x1, y1), (x2, y2), (0, 255, 0), 2)

    cv2.imwrite(output_path, image)
    print(f"Saved visualization to {output_path}")

if __name__ == "__main__":
    predictor = load_model()
    masks, boxes, image = segment_person("../tests/test_images/test_img1.jpg", predictor)
    visualize_results(image, masks, boxes)

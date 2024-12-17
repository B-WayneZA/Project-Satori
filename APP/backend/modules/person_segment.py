import cv2
import torch
import os
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
    outputs = predictor(image)
    instances = outputs["instances"]
    masks = instances.pred_masks.cpu().numpy()
    boxes = instances.pred_boxes.tensor.cpu().numpy()
    return masks, boxes, image

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

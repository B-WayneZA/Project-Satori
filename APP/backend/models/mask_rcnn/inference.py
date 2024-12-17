import cv2
from detectron2.engine import DefaultPredictor
from config import get_mask_rcnn_cfg

def segment_image(image_path):
    cfg = get_mask_rcnn_cfg()
    predictor = DefaultPredictor(cfg)
    image = cv2.imread(image_path)
    outputs = predictor(image)
    return outputs

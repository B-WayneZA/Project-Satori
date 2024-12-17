from detectron2.data.datasets import register_coco_instances
from detectron2.config import get_cfg

register_coco_instances("clothing_train", {}, "data/train.json", "data/images/train")
register_coco_instances("clothing_val", {}, "data/val.json", "data/images/val")

cfg = get_cfg()
cfg.DATASETS.TRAIN = ("clothing_train",)  # For training
cfg.DATASETS.TEST = ("clothing_val",)    # For testing

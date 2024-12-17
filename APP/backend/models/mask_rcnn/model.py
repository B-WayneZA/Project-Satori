from detectron2.engine import DefaultTrainer
from detectron2.data import DatasetCatalog, MetadataCatalog
from config import get_mask_rcnn_cfg

def train_model():
    cfg = get_mask_rcnn_cfg()
    trainer = DefaultTrainer(cfg)
    trainer.resume_or_load(resume=False)
    trainer.train()

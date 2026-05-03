# Image Captioning Pipeline

Enterprise-style deep learning pipeline for generating captions from images.

## Structure
- `main.py`: primary training/inference runner.
- `configs/`: runtime config template.
- `scripts/`: bootstrap + run entrypoints.
- `docs/`: architecture notes.

## Quickstart
```bash
./scripts/bootstrap.sh
./scripts/run_pipeline.sh
```

## Example Dataset
- Flickr8k is the current example dataset used by this project.

#!/bin/bash
export HF_ENDPOINT=https://hf-mirror.com
export WANDB_BASE_URL=https://api.bandw.top
export MODEL_NAME="stable-diffusion-v1-5/stable-diffusion-v1-5"
export TRAIN_DIR="/root/diffusers/memsdata/train"
export OUTPUT_DIR="/root/diffusers/output"

accelerate launch examples/text_to_image/train_text_to_image.py \
  --pretrained_model_name_or_path=$MODEL_NAME \
  --train_data_dir=$TRAIN_DIR \
  --output_dir=$OUTPUT_DIR \
  --resolution=512 \
  --train_batch_size=2 \
  --gradient_accumulation_steps=4 \
  --resume_from_checkpoint="/root/diffusers/output/checkpoint-1500" \
  --learning_rate=1e-4 \
  --max_train_steps=3000 \
  --validation_epochs=1 \
  --validation_prompt="X_freq:145000,Y_freq:130000,X_stiffness:8500,Y_stiffness:8000"\
  --report_to="wandb"
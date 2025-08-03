#!/bin/bash
export HF_ENDPOINT=https://hf-mirror.com
export MODEL_NAME="stable-diffusion-v1-5/stable-diffusion-v1-5"
export TRAIN_DIR="/root/diffusers/memsdata/train"
export OUTPUT_DIR="/root/diffusers/output"

accelerate launch examples/text_to_image/train_text_to_image_lora.py \
  --pretrained_model_name_or_path=$MODEL_NAME \
  --train_data_dir=$TRAIN_DIR \
  --output_dir=$OUTPUT_DIR \
  --resolution=512 \
  --train_batch_size=2 \
  --gradient_accumulation_steps=4 \
  --learning_rate=1e-4 \
  --max_train_steps=3000 \
  --validation_prompt=""X_freq":115000,"Y_freq":110000,"X_stiffness":6000,"Y_stiffness":6000" \
  --report_to="wandb"
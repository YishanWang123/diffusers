#!/bin/bash
export HF_HOME=/data/hf
export TRANSFORMERS_CACHE=/data/hf/transformers
export DIFFUSERS_CACHE=/data/hf/diffusers
export HF_DATASETS_CACHE=/data/hf/datasets        # 或 DATASETS_CACHE 也可
export WANDB_DIR=/data/wandb
export HF_ENDPOINT=https://hf-mirror.com
export WANDB_BASE_URL=https://api.bandw.top
export MODEL_NAME="stable-diffusion-v1-5/stable-diffusion-v1-5"
export TRAIN_DIR="/data/memsdata/train"
export OUTPUT_DIR="/data"

accelerate launch examples/text_to_image/train_text_to_image.py \
  --pretrained_model_name_or_path=$MODEL_NAME \
  --train_data_dir=$TRAIN_DIR \
  --output_dir=$OUTPUT_DIR \
  --resolution=512 \
  --train_batch_size=4 \
  --gradient_accumulation_steps=4 \
  --learning_rate=2e-5 \
  --max_train_steps=6000 \
  --validation_epochs=1 \
  --validation_prompts \
    "drive_freq:67400Hz,split:between_1.0%_and_3.0%,parasitic:berween_10000_and_15000Hz,x_stiffness:17000N/m,nonlinearity:relatively_low" \
    "drive_freq:62600Hz,split:between_3.0%_and_5.0%,parasitic:berween_10000_and_15000Hz,x_stiffness:16800N/m,nonlinearity:relatively_low" \
    "drive_freq:51800Hz,split:between_1.0%_and_3.0%,parasitic:berween_10000_and_15000Hz,x_stiffness:10000N/m,nonlinearity:relatively_low" \
    "drive_freq:52500Hz,split:between_3.0%_and_5.0%,parasitic:berween_10000_and_15000Hz,x_stiffness:10400N/m,nonlinearity:relatively_low" \
    "drive_freq:47600Hz,split:between_3.0%_and_5.0%,parasitic:berween_5000_and_10000Hz,x_stiffness:10000N/m,nonlinearity:moderate" \
    "drive_freq:41900Hz,split:between_5.0%_and_7.0%,parasitic:less_than_5000Hz,x_stiffness:6500N/m,nonlinearity:relatively_high" \
    "drive_freq:43800Hz,split:between_3.0%_and_5.0%,parasitic:berween_5000_and_10000Hz,x_stiffness:7500N/m,nonlinearity:relatively_high" \
    "drive_freq:57100Hz,split:between_0.5%_and_1.0%,parasitic:berween_15000_and_20000Hz,x_stiffness:12300N/m,nonlinearity:relatively_low" \
  --report_to="wandb"
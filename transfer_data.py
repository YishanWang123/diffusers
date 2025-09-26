# add_text_minimal.py

import json
import sys

def add_text_minimal(input_path, output_path):
    fields = ["X_freq", "Y_freq", "X_stiffness", "Y_stiffness"]
    with open(input_path, 'r', encoding='utf-8') as fin, \
         open(output_path, 'w', encoding='utf-8') as fout:
        for line in fin:
            record = json.loads(line)
            # 构造纯文本 snippet
            snippet = ",".join(f"{k}:{record[k]}" for k in fields)
            # 只保留 image_file_name 和 text
            out = {
                "image_file_name": record["image_file_name"],
                "text": snippet
            }
            fout.write(json.dumps(out, ensure_ascii=False) + "\n")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("用法: python add_text_minimal.py input.jsonl output.jsonl")
        sys.exit(1)
    add_text_minimal(sys.argv[1], sys.argv[2])
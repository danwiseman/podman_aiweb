#!/bin/bash
set -e  # Exit the script if any statement returns a non-true return value

echo "Starting SD.Next"
cd /sdnext/automatic && \
bash webui.sh \
    --listen \
    --docs \
    --use-cuda \
    --port ${SD_NEXT_PORT:-7860} \
    --debug
echo "SD.Next started, log in /automatic/sd_next.log"
sleep infinity
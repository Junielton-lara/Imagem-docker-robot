#!/bin/bash
echo ""
echo "=============================================================================="
echo ""
echo "Executing command '$@'"
echo ""
echo "Install Dependencies"
echo ""
echo "=============================================================================="
echo ""
export DISPLAY=:99

# cd $WORK_DIRECTORY

pip3 install -r "requirements.txt"
set -e

echo ""
echo "=============================================================================="
echo ""
echo "Starting X virtual framebuffer (Xvfb) in background..."
echo ""
echo "=============================================================================="
echo ""
xvfb-run --server-args="-screen 0 1920x1080x24 -ac" $@
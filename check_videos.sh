#!/bin/bash
PROJECT_DIR="/Users/abhisheksrivastav/Documents/Sarav fabrication  "
cd "$PROJECT_DIR"

echo "=== SARAV Fabrication Video Files Status ==="
echo "Project Directory: $PROJECT_DIR"
echo ""

VIDEOS=("cRbs7d8sijg.mp4" "Xe_CNXSrhbI.mp4" "0PMhwc4Cl-o.mp4")
MISSING=0

for video in "${VIDEOS[@]}"; do
    if [ -f "$video" ]; then
        SIZE=$(ls -lh "$video" | awk '{print $5}')
        echo "✅ [FOUND] $video ($SIZE)"
    else
        echo "❌ [MISSING] $video"
        MISSING=$((MISSING + 1))
    fi
done

echo ""
if [ $MISSING -gt 0 ]; then
    echo "⚠️  Action Required:"
    echo "Please copy the missing MP4 files into the project root directory:"
    echo "Folder: $PROJECT_DIR"
    echo "Names must match exactly (case-sensitive):"
    for video in "${VIDEOS[@]}"; do
        if [ ! -f "$video" ]; then
            echo "  - $video"
        fi
    done
else
    echo "🎉 All video files are present and will load correctly on the website!"
fi
echo "============================================"

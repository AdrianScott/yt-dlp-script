#!/bin/bash

echo "starting"

# Check if a URL was provided
if [ -z "$1" ]; then
    echo "No URL provided. Please provide a URL."
    exit 1
fi

echo "check audio"
# Check if audio-only download is requested
audio_only=false
#while (( $# ))
#do
    case "$1" in
        -a|--audio)
            audio_only=true
            shift
            ;;
        *)
            # Unknown option, ignore it
            ;;
    esac
#done

echo "lets download"
# Run Youtube-DL command with the provided URL and options
if [ "$audio_only" = true ]; then
    echo "audio only"
    yt-dlp --no-mtime -x --audio-format=mp3 "$1"
else
    echo "no audio"
    yt-dlp --no-mtime "$1"
fi

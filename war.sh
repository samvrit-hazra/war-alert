#!/bin/bash
last=""
sudo echo ""
while true; do
	rss=$(curl -s "https://www.bing.com/news/search?q=iran&qft=sortbydate%3d%221%22&form=YFNR&format=rss")
	title=$(echo "$rss" | xmllint --xpath 'string(//item[1]/title)' - 2>/dev/null)
	content=$(echo "$rss" | xmllint --xpath 'string(//item[1]/description)' - 2>/dev/null)
	current="$title. $content"
	if [ -n "$current" ] && [ "$current" != "$last" ]; then
		sentence=$(ollama run gemma3:1b "summarize in one sentence: $current")
		mpv siren.mp3 --no-video --really-quiet
		google_speech -l en-us "BREAKING NEWS... $sentence"
		last="$current"
		sudo killall ollama
	fi
	sleep 10
done

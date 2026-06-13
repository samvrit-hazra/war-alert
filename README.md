# War Alert
Tiny shell script to get breaking news alerts during US-Iran war.

Every 10 seconds, the script fetches Bing News search results through RSS feed.
Whenever a new headline is found, a siren sound plays.
A locally running LLM generates a summary of the headline, which is played by text-to-speech.

## Usage (Debian GNU/Linux)
Warning: Some of the following commands install or utilize third-party dependencies such as ollama, gemma3, google-speech, git etc. They are not part of this project and may have different licenses. They may also cause unintended effects on your system, they are not verified or endorsed by this project, use them at your own responsibility.

```
curl -fsSL https://ollama.com/install.sh | sh
```

```
ollama pull gemma3:1b
```


```
sudo apt install python3 pipx git mpv sox libsox-fmt-all -y
```

```
pipx install google-speech
```

```
git clone https://github.com/samvrit-hazra/war-alert/
```

```
cd war-alert/
```

```
chmod +x war.sh
```

```
./war.sh
```

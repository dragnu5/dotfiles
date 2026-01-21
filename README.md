# My Dotfiles & Scripts

A collection of Fish shell functions and automation scripts for Arch Linux.

## 1. fftools
A little fish wrapper for FFmpeg

### Features
- **Smart Rotation:** Lossless metadata rotation for video files.
- **HEVC/AV1 Checker:** Scans folders and moves inefficient codecs to an `enc` folder for processing.
- **Frame Extraction:** Extracts frames to intelligent folder structures (`video_name/frames/`).
- **Frame Combination:** Stitches frames back into video (supports gaps in frame sequences).
- **Concatenation:** Quickly combines all MP4s in a folder without re-encoding.

### Installation
Run the following in your terminal to install the function and autocompletions:

```fish
# Install Function
curl -L [https://raw.githubusercontent.com/YOUR_USER/dotfiles/main/fish/functions/fftools.fish](https://raw.githubusercontent.com/YOUR_USER/dotfiles/main/fish/functions/fftools.fish) > ~/.config/fish/functions/fftools.fish

# Install Completions
curl -L [https://raw.githubusercontent.com/YOUR_USER/dotfiles/main/fish/completions/fftools.fish](https://raw.githubusercontent.com/YOUR_USER/dotfiles/main/fish/completions/fftools.fish) > ~/.config/fish/completions/fftools.fish
```

Usage

```
fftools rotate -90 video.mp4
fftools checkhevc
fftools extractframes video.mp4
fftools combineframes 60 ./folder out.mp4
fftools combinevids output.mp4
```

## 2. tdl (OrpheusDL)

A smart wrapper to run OrpheusDL inside its virtual environment automatically.
Installation

### 1. Install the Script

```
curl -L [https://raw.githubusercontent.com/YOUR_USER/dotfiles/main/fish/functions/tdl.fish](https://raw.githubusercontent.com/YOUR_USER/dotfiles/main/fish/functions/tdl.fish) > ~/.config/fish/functions/tdl.fish
curl -L [https://raw.githubusercontent.com/YOUR_USER/dotfiles/main/fish/completions/tdl.fish](https://raw.githubusercontent.com/YOUR_USER/dotfiles/main/fish/completions/tdl.fish) > ~/.config/fish/completions/tdl.fish
```

### 2. Set up the Backend If you are on a new machine, follow these steps to set up the OrpheusDL core:

#### Clone the Repo
```
cd ~/Music
git clone [https://github.com/OrfiTeam/OrpheusDL.git](https://github.com/OrfiTeam/OrpheusDL.git)
cd OrpheusDL
```
#### Create Virtual Environment
```
python -m venv .venv
```
#### Activate & Install Dependencies
```
source .venv/bin/activate.fish
pip install -r requirements.txt
```

#### Initialize Settings
```
python orpheus.py settings refresh
```
### Usage

#### Auto-detects URL for download
```
tdl "http://tidal.com/album/12345"
```
#### Auto-detects general search (searches tracks)
```
tdl "Something to Hide"
```
#### Specific search types
```
tdl album "Pink Floyd"
```
## 3. yee (Yeelight)
ds
A wrapper for yeecli with built-in color presets.
Installation

1. Install Dependencies Install python-yeecli from the AUR:


```Bash
yay -S python-yeecli
```
2. Install Script

```
curl -L [https://raw.githubusercontent.com/YOUR_USER/dotfiles/main/fish/functions/yee.fish](https://raw.githubusercontent.com/YOUR_USER/dotfiles/main/fish/functions/yee.fish) > ~/.config/fish/functions/yee.fish
curl -L [https://raw.githubusercontent.com/YOUR_USER/dotfiles/main/fish/completions/yee.fish](https://raw.githubusercontent.com/YOUR_USER/dotfiles/main/fish/completions/yee.fish) > ~/.config/fish/completions/yee.fish
```
3. Configure Bulb Create 
```
~/.config/yeecli/yeecli.cfg
```
[default]
ip = 192.168.1.1

## Color Picker
wl-colorpicker-plasma
wl-clipboard

```
#!/bin/bash
set -e
color=$(wl-colorpicker-plasma | grep -oE '[a-fA-F0-9]{6}' | tr -d '\n')
echo -n "$color" | wl-copy
```
"$HOME/.local/bin/colorpicker"
```
chmod +x ~/.local/bin/colorpicker
```


or...

```
mkdir -p ~/.local/bin && printf '#!/bin/bash\nset -e\ncolor=$(wl-colorpicker-plasma | grep -oE '\''[a-fA-F0-9]{6}'\'' | tr -d '\''\\n'\'')\necho -n "$color" | wl-copy\n' > ~/.local/bin/colorpicker && chmod +x ~/.local/bin/colorpicker
```

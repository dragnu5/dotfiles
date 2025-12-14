# Disable file completion
complete -c yee -f

# 1. Main Subcommands (Removed sat/hue)
set -l commands brightness hsv preset pulse rgb save status temperature toggle turn

complete -c yee -n "not __fish_seen_subcommand_from $commands" -a "$commands"

# Brightness
complete -c yee -n "__fish_seen_subcommand_from brightness" -a "10 25 50 75 100"

#HSV

# Preset
complete -c yee -n "__fish_seen_subcommand_from preset" -a "alarm christmas disco lsd police police2 random redgreenblue slowdown stop strobe sunrise temp"

# Pulse
complete -c yee -n "__fish_seen_subcommand_from pulse" -a "red green blue white warm cool purple orange cyan magenta"

# RGB: Suggest presets
complete -c yee -n "__fish_seen_subcommand_from rgb" -a "red green blue white warm cool purple orange cyan magenta"

# Temperature: Suggest common Kelvin values
complete -c yee -n "__fish_seen_subcommand_from temperature" -a "1700 2700 4000 6500"

# turn subcommand
complete -c yee -n "__fish_seen_subcommand_from turn" -a "on off"

# 2. Flag Completions
complete -c yee -l ip -d "Target specific IP" -r

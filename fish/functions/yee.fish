# Disable file completion
complete -c yee -f

# 1. Main Subcommands
set -l commands toggle on off rgb brightness temperature hue sat

complete -c yee -n "not __fish_seen_subcommand_from $commands" -a "$commands"

# 2. Flag Completions
complete -c yee -l ip -d "Target specific IP" -r # -r means it expects an argument (the IP)

# 3. Argument Completions
# RGB: Suggest our presets
complete -c yee -n "__fish_seen_subcommand_from rgb" -a "red green blue white warm cool purple orange cyan magenta"

# Brightness: Suggest steps of 10
complete -c yee -n "__fish_seen_subcommand_from brightness" -a "10 25 50 75 100"

# Temperature: Suggest common Kelvin values
complete -c yee -n "__fish_seen_subcommand_from temperature" -a "1700 2700 4000 6500"

# Disable file completion for the main command to show subcommands first
complete -c fftools -f

# Define subcommands
set -l commands rotate checkhevc extractframes combineframes combinevids help

# Basic subcommand completion
complete -c fftools -n "not __fish_seen_subcommand_from $commands" -a "$commands"

# Specific argument completions
# rotate: expects files
complete -c fftools -n "__fish_seen_subcommand_from rotate" -F

# checkhevc: expects directories
complete -c fftools -n "__fish_seen_subcommand_from checkhevc" -a "(__fish_complete_directories)"

# extractframes: expects files or directories
complete -c fftools -n "__fish_seen_subcommand_from extractframes" -F

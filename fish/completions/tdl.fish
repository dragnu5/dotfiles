# Disable file completion
complete -c tdl -f

# Suggest the explicit search modes
complete -c tdl -n "not __fish_seen_subcommand_from track album artist playlist" -a "track album artist playlist"

function tdl --description "Smart OrpheusDL Wrapper"
    set -l tdl_dir "$HOME/Music/OrpheusDL"

    # 1. Validation and Setup
    if not test -d "$tdl_dir"
        echo "Error: Directory $tdl_dir not found."
        return 1
    end

    if not set -q VIRTUAL_ENV
        if test -f "$tdl_dir/.venv/bin/activate.fish"
            source "$tdl_dir/.venv/bin/activate.fish"
        else
            echo "Error: Virtual environment not found."
            return 1
        end
    end

    set -l original_dir (pwd)
    builtin cd "$tdl_dir"

    # 2. Smart Argument Handling
    if test (count $argv) -eq 0
        echo "Usage: tdl [url | track/album/artist search_term | search_term]"
        builtin cd "$original_dir"
        return 1
    end

    set -l first_arg $argv[1]

    if string match -q "http*" "$first_arg"
        # CASE A: Input is a URL -> Download mode
        echo "Detected URL. Downloading..."
        python orpheus.py download $argv

    else if contains "$first_arg" track album artist playlist
        # CASE B: Input starts with explicit type -> Search specific type
        # usage: tdl album "Pink Floyd"
        set -l query $argv[2..-1]
        echo "Searching Tidal for $first_arg: $query"
        python orpheus.py search tidal "$first_arg" "$query"

    else
        # CASE C: General Input -> Assume it's a Track Search
        # usage: tdl "something to hide"
        echo "Searching Tidal tracks for: $argv"
        python orpheus.py search tidal track "$argv"
    end

    # 3. Cleanup
    builtin cd "$original_dir"
end

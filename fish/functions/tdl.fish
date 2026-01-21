function tdl --description "Tidal DL"
    set -l tdl_base "$HOME/Music"
    set -l tdl_dir "$tdl_base/OrpheusDL"
    set -l venv_dir "$tdl_dir/.venv"
    set -l tidal_mod_dir "$tdl_dir/modules/tidal"
    set -l py "$venv_dir/bin/python"

    # --- Phase 1: Main Repo Check ---
    if not test -d "$tdl_dir"
        echo "OrpheusDL missing. Cloning..."
        mkdir -p "$tdl_base"
        git clone https://github.com/dragnu5/OrpheusDL.git "$tdl_dir"
    end

    # --- Phase 2: Venv Check ---
    if not test -f "$py"
        echo "Venv broken or missing. Rebuilding..."
        rm -rf "$venv_dir"
        python -m venv "$venv_dir"
        "$venv_dir/bin/pip" install -U pip
        "$venv_dir/bin/pip" install -r "$tdl_dir/requirements.txt"
    end

    # --- Phase 3: Tidal Module Check ---
    if not test -d "$tidal_mod_dir"
        echo "Tidal module missing. Installing..."
        # We need to be in the dir to clone correctly into modules/tidal
        builtin cd "$tdl_dir"
        git clone --recurse-submodules https://github.com/Dniel97/orpheusdl-tidal.git "modules/tidal"

        # Initialize settings.json so Orpheus knows the module exists
        "$py" orpheus.py --help > /dev/null 2>&1
    end

    # --- Phase 4: Execution Logic ---
    if test (count $argv) -eq 0
        echo "Usage: tdl [url | update | (album/artist/track) search_term]"
        return 1
    end

    builtin cd "$tdl_dir"
    set -l first "$argv[1]"

    # UPDATE Command
    if test "$first" = "update"
        echo "Updating OrpheusDL and Tidal..."
        git pull
        git -C "modules/tidal" pull
        "$venv_dir/bin/pip" install -r requirements.txt
        echo "Done."
        return 0
    end

    # URL Handling
    if string match -q "http*" "$first"
        "$py" orpheus.py "$argv"
        return 0
    end

    # SEARCH Handling
    if contains "$first" album artist playlist track
        set -l mode $argv[1]
        set -l query $argv[2..-1]
        "$py" orpheus.py search tidal "$mode" "$query"
    else
        # Default to track search
        set -l query $argv
        "$py" orpheus.py search tidal track "$query"
    end
end

function yee --description "Wrapper for yeecli with color presets"
    set -l final_args

    # Default to toggle if no arguments
    if test (count $argv) -eq 0
        set final_args toggle
    else
        # Existing arg processing loop...
        for arg in $argv
            switch $arg
                # --- Color Presets ---
                case red;     set -a final_args "FF0000"
                case green;   set -a final_args "00FF00"
                case blue;    set -a final_args "0000FF"
                case white;   set -a final_args "FFFFFF"
                case warm;    set -a final_args "FFD1A4" # Nice warm white
                case cool;    set -a final_args "F4FFFA" # Cool white
                case purple;  set -a final_args "800080"
                case orange;  set -a final_args "FFA500"
                case cyan;    set -a final_args "00FFFF"
                case magenta; set -a final_args "FF00FF"

                # --- Pass everything else through ---
                case '*'
                    set -a final_args $arg
            end
        end
    end

    yeecli $final_args
end



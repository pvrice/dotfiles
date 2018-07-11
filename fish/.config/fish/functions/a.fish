# select an anime to watch with fzf
function a
    if not set -q anime_path
        echo anime_path not set
        return 1
    end

    set -l anime \
    (printf '%s\n' $anime_path/airing/*/*/*/ $anime_path/archive/*/ \
        | string replace $anime_path '' \
        | fzf --preview="ls $anime_path/{}")
    or return 1
    and commandline 'mpv '(string escape -n (realpath "$anime_path/$anime"))
    and commandline -f execute
end

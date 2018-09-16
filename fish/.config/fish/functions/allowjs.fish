function allowjs
    if test (count $argv) = 0
        echo 'no domains provided'
        return 1
    end

    set -l domains $XDG_CONFIG_HOME/qutebrowser/conf.d/domains

    if not test -e $domains
        echo "$domains does not exist"
        return 1
    end

    set backup (mktemp -t domains.XXXXXXXXXX)
    and cp $domains $backup
    or begin
        echo 'failed to create backup'
        return 1
    end

    cat $domains (string split ' ' $argv | psub) | sort -u -o $domains
    or begin
        echo 'failed to modify the whitelist'
        cp $backup $domains
    end
end

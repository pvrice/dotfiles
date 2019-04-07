function allowjs
    if test (count $argv) = 0
        echo 'no domains provided'
        return 1
    end

    set config_home (test -z $XDG_CONFIG_HOME; and echo ~/.config)
    set -l domains $config_home/qutebrowser/conf.d/domains

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

    cat $domains (string split ' ' $argv | sed -e 's|^|*://|' -e 's|$|/*|' | psub) | sort -u -o $domains
    or begin
        echo 'failed to modify the whitelist'
        cp $backup $domains
    end
end

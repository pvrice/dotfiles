import glob
import os.path

c.aliases = {
        'q': 'quit',
        'w': 'session-save',
        'wq': 'quit --save',
        'x': 'quit --save',
        'h': 'help'
        }

c.bindings.commands = {
        'command': {
            '<Ctrl-w>': 'rl-backward-kill-word',
            # TODO not the most convenient mapping
            '<Ctrl-Shift-w>': 'rl-unix-word-rubout'
            },
        'prompt': {
            '<Ctrl-w>': 'rl-backward-kill-word',
            '<Ctrl-Shift-w>': 'rl-unix-word-rubout'
            }
        }

c.confirm_quit = ['downloads']

c.new_instance_open_target = 'tab-silent'
c.new_instance_open_target_window = 'last-focused'

c.editor.command = ['termite', '-e', 'bash -c \'exec nvim -f {file} -c "normal {line}G{column0}l"\'']

c.auto_save.session = True

c.content.host_blocking.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']
c.content.javascript.enabled = True
c.content.autoplay = False
c.content.pdfjs = True
c.content.netrc_file = '~/.netrc'

c.completion.shrink = True
c.completion.scrollbar.width = 0
c.completion.scrollbar.padding = 0
c.completion.open_categories = ['quickmarks', 'bookmarks', 'history']

c.hints.auto_follow = 'always'
c.hints.auto_follow_timeout = 400
c.hints.mode = 'number'

c.search.incremental = False

c.tabs.background = True
c.tabs.favicons.scale = 0.9
c.tabs.last_close = 'close'
c.tabs.padding = {'bottom': 4, 'left': 3, 'right': 3, 'top': 4}
c.tabs.mode_on_change = 'restore'
c.tabs.show = 'multiple'
c.tabs.indicator.width = 0

c.url.open_base_url = True
c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        'ap': 'https://archlinux.org/packages/?q={}',
        'aur': 'https://aur.archlinux.org/packages.php?K={}',
        'a': 'https://wiki.archlinux.org/?search={}',
        'd': 'https://duckduckgo.com/?q={}',
        'gi': 'https://github.com/search?q={}',
        'ho': 'https://www.haskell.org/hoogle/?hoogle={}',
        'ji': 'http://jisho.org/search/{}',
        'ra': 'https://rateyourmusic.com/search?searchtype=a&searchterm={}',
        'wikt': 'https://en.wiktionary.org/wiki/Special:Search?search={}',
        'w': 'https://en.wikipedia.org/wiki/Special:Search?search={}',
        'y': 'https://youtube.com/results?search_query={}'
        }

c.fonts.monospace = '"Sarasa Term J", monospace'

mono = '13pt monospace'
c.fonts.completion.entry = mono
c.fonts.completion.category = 'bold ' + mono
c.fonts.debug_console = mono
c.fonts.downloads = mono
c.fonts.hints = 'bold 12pt monospace'
c.fonts.keyhint = mono
c.fonts.messages.error = mono
c.fonts.messages.info = mono
c.fonts.messages.warning = mono
c.fonts.statusbar = mono
c.fonts.tabs = mono

config.bind(',P', 'open -b -- {primary}')
config.bind(',X', 'spawn -dv mpv --profile=no-term {url}')
config.bind(',p', 'open -b -- {clipboard}')
config.bind(',x', 'hint links spawn -dv mpv --profile=no-term {hint-url}')
config.bind(',d', 'hint all delete')

for f in glob.glob(str(config.configdir / 'conf.d' / '*.py')):
    config.source(str(os.path.relpath(f, start=config.configdir)))

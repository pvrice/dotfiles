import glob
import os.path

c.aliases = {
        'q': 'quit',
        'w': 'session-save',
        'wq': 'quit --save',
        'x': 'quit --save',
        'h': 'help'
        }

c.confirm_quit = ['downloads']

c.new_instance_open_target = 'tab-silent'
c.new_instance_open_target_window = 'last-focused'

c.editor.command = ['termite', '-e', 'bash -c \'exec nvim -f {file} -c "normal {line}G{column0}l"\'']

c.qt.force_platform = 'xcb'

c.auto_save.session = True

c.content.host_blocking.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']
c.content.javascript.enabled = False

c.completion.shrink = True
c.completion.scrollbar.width = 0
c.completion.scrollbar.padding = 0

c.hints.auto_follow = 'always'
c.hints.auto_follow_timeout = 400
c.hints.mode = 'number'

c.tabs.background = True
c.tabs.favicons.scale = 0.9
c.tabs.last_close = 'close'
c.tabs.padding = {'bottom': 3, 'left': 5, 'right': 5, 'top': 2}
c.tabs.mode_on_change = 'restore'
c.tabs.show = 'multiple'
c.tabs.indicator.width = 0

c.url.open_base_url = True
c.url.searchengines = {
        'DEFAULT': 'https://www.ecosia.org/search?q={}',
        'ap': 'https://archlinux.org/packages/?q={}',
        'aur': 'https://aur.archlinux.org/packages.php?K={}',
        'ar': 'https://wiki.archlinux.org/?search={}',
        'dd': 'https://duckduckgo.com/?q={}',
        'ec': 'https://www.ecosia.org/search?q={}',
        'gi': 'https://github.com/search?q={}',
        'ji': 'http://jisho.org/search/{}',
        'ra': 'https://rateyourmusic.com/search?searchtype=a&searchterm={}',
        'wikt': 'https://en.wiktionary.org/wiki/Special:Search?search={}',
        'wi': 'https://en.wikipedia.org/wiki/Special:Search?search={}',
        'yo': 'https://youtube.com/results?search_query={}'
        }

c.fonts.monospace = '"Sarasa Term J", monospace'

mono = '13pt monospace'
small_mono = '12pt monospace'
c.fonts.completion.entry = mono
c.fonts.completion.category = 'bold ' + mono
c.fonts.debug_console = mono
c.fonts.downloads = mono
c.fonts.hints = 'bold 11pt monospace'
c.fonts.keyhint = small_mono
c.fonts.messages.error = small_mono
c.fonts.messages.info = small_mono
c.fonts.messages.warning = small_mono
c.fonts.statusbar = mono
c.fonts.tabs = mono

config.bind(',P', 'open -b -- {primary}')
config.bind(',X', 'spawn -dv mpv --profile=no-term {url}')
config.bind(',p', 'open -b -- {clipboard}')
config.bind(',x', 'hint all spawn -dv mpv --profile=no-term {hint-url}')

for f in glob.glob(str(config.configdir / 'conf.d' / '*.py')):
    config.source(str(os.path.relpath(f, start=config.configdir)))

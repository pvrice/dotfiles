#vim:ft=py
for protocol in (
        'file',
        'chrome',
        'qute'
        ):
    config.set('content.javascript.enabled', True, protocol + '://*')

try:
    f = open(config.configdir / 'conf.d' / 'domains', 'r')
except FileNotFoundError:
    config.set('content.javascript.enabled', True)
else:
    for domain in f.read().splitlines():
        config.set('content.javascript.enabled', True, '*://' + domain + '/*')

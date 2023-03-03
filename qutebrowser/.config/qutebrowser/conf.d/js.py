# pylint: disable=C0111
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401

config: ConfigAPI = config  # noqa: F821 pylint: disable=E0602,C0103
c: ConfigContainer = c  # noqa: F821 pylint: disable=E0602,C0103

if not config.get("content.javascript.enabled"):
    for protocol in ("file", "chrome", "qute"):
        config.set("content.javascript.enabled", True, protocol + "://*")

    try:
        with open(config.configdir / "conf.d" / "domains", "r") as f:
            for domain in f.read().splitlines():
                config.set("content.javascript.enabled", True, domain)
    except FileNotFoundError:
        config.set("content.javascript.enabled", True)

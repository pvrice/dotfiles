if not config.get("content.javascript.enabled"):
    for protocol in ("file", "chrome", "qute"):
        config.set("content.javascript.enabled", True, protocol + "://*")

    try:
        with open(config.configdir / "conf.d" / "domains", "r") as f:
            for domain in f.read().splitlines():
                config.set("content.javascript.enabled", True, domain)
    except FileNotFoundError:
        config.set("content.javascript.enabled", True)

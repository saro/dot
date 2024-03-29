import subprocess
import os
from qutebrowser.api import interceptor

config.load_autoconfig()

# ================== Youtube Add Blocking =======================
def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (url.host() == "www.youtube.com" and url.path() == "/get_video_info" and "&adformat=" in url.query()):
        info.block()

interceptor.register(filter_yt)

c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}
c.session.lazy_restore = False
c.backend = 'webengine'
c.qt.force_software_rendering = 'qt-quick'
c.auto_save.session = True
c.content.autoplay = False
c.content.cache.size = None
c.content.cookies.accept = 'all'
# c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36'
c.content.blocking.method = 'adblock'
#c.content.host_blocking.lists = ['https://www.malwaredomainlist.com/hostslist/hosts.txt', 'http://someonewhocares.org/hosts/hosts', 'http://winhelp2002.mvps.org/hosts.zip', 'http://malwaredomains.lehigh.edu/files/justdomains.zip', 'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext']
c.content.javascript.enabled = False
c.content.plugins = False
c.content.private_browsing = False
c.content.xss_auditing = True
c.content.mute = False;
c.completion.height = '35%'
c.completion.quick = True
c.completion.timestamp_format = '%Y-%m-%d'
c.completion.web_history.max_items = 5000
c.completion.use_best_match = True
c.downloads.location.prompt = True
c.downloads.open_dispatcher = None
c.downloads.position = 'bottom'
c.downloads.remove_finished = -1
c.editor.command = ['nvim-qt', '--nofork', '{}', '--', '-c set tw=70', '-c set spell', '-c set ft=markdown']
c.editor.encoding = 'utf-8'
c.hints.chars = 'asfghjklbcnx'
c.hints.dictionary = '/usr/share/dict/words'
c.hints.next_regexes = ['\\bnext\\b', '\\bmore\\b', '\\bnewer\\b', '\\b[>→≫]\\b', '\\b(>>|»)\\b', '\\bcontinue\\b']
c.input.forward_unbound_keys = 'none'
c.input.insert_mode.auto_load = True
c.input.partial_timeout = 0
# c.input.rocker_gestures = False
c.keyhint.delay = 500
c.messages.timeout = 2000
c.spellcheck.languages = ['en-GB']
# c.statusbar.hide = False
c.statusbar.padding = {'bottom': 1, 'left': 0, 'right': 0, 'top': 1}
c.statusbar.position = 'bottom'
c.tabs.background = True
c.tabs.close_mouse_button = 'middle'
c.tabs.favicons.scale = 1.0
c.tabs.favicons.show = 'always'
c.tabs.mousewheel_switching = False
c.tabs.new_position.related = 'next'
c.tabs.padding = {'bottom': 3, 'left': 5, 'right': 5, 'top': 3}
c.tabs.position = 'left'
c.tabs.show = 'always'
c.tabs.title.format = '<{index}>'
c.tabs.title.format_pinned = '[{index}]'
c.tabs.width = 90
c.tabs.min_width = -1
c.tabs.indicator.width = 5
c.tabs.indicator.padding = {'bottom': 5, 'left': 0, 'right': 4, 'top': 5}
c.tabs.pinned.shrink = True
c.url.auto_search = 'dns'
c.url.default_page = 'about:blank'
c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?hl=en&q={}', 'sh': 'https://www.shodan.io/host/{}', 'wa': 'https://wiki.archlinux.org/?search={}', 'g': 'https://www.google.com/search?hl=en&q={}', 'sp': 'https://startpage.com/do/asearch?q={}', 'ddg': 'https://duckduckgo.com/?q={}', 'ei': 'http://www.wordreference.com/enit/{}', 'ie': 'http://www.wordreference.com/iten/{}', 'm': 'https://www.google.com/maps?q={}', 'o': 'https://lexico.com/definition/{}'}
c.window.title_format = '{private}//qutebrowser - {perc}{current_title}{title_sep}'
c.zoom.default = '100%'
c.zoom.levels = ['25%', '33%', '50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '250%', '300%', '400%', '500%']
c.colors.hints.bg = 'rgba(255, 197, 66, 1)'
c.colors.hints.match.fg = 'green'
c.colors.keyhint.bg = 'rgba(0, 0, 0, 100%)'
c.colors.messages.warning.fg = 'black'
c.colors.tabs.odd.bg = 'grey'
c.colors.tabs.even.bg = 'grey'
c.colors.tabs.pinned.odd.bg = 'grey'
c.colors.tabs.pinned.even.bg = 'grey'
c.colors.tabs.pinned.selected.even.fg = 'white'
c.colors.tabs.pinned.selected.even.bg = 'black'
c.fonts.completion.entry = '11pt share tech mono'
c.fonts.completion.category = '11pt share tech mono'
c.fonts.debug_console = '11pt share tech mono'
c.fonts.downloads = '11pt share tech mono'
c.fonts.hints = 'bold 11pt share tech mono'
c.fonts.keyhint = '11pt share tech mono'
c.fonts.messages.error = '11pt share tech mono'
c.fonts.messages.info = '11pt share tech mono'
c.fonts.messages.warning = '11pt share tech mono'
c.fonts.prompts = '11pt share tech mono'
c.fonts.statusbar = '11pt share tech mono'
c.fonts.tabs.selected = '11pt share tech mono'
c.fonts.tabs.unselected = '11pt share tech mono'
# c.fonts.tabs = '12pt share tech mono'
c.fonts.web.size.minimum_logical = 8
config.bind(';', 'set-cmd-text :')
config.bind('<Ctrl+h>', 'tab-prev')
config.bind('<Ctrl+j>', 'scroll-px 0 400')
config.bind('<Ctrl+k>', 'scroll-px 0 -400')
config.bind('<Ctrl+l>', 'tab-next')
# config.bind('<Ctrl+v>', None)
config.bind('<Shift+Space>', 'run-with-count 25 scroll up')
config.bind('<Space>', 'run-with-count 25 scroll down')
config.bind('b', 'set-cmd-text -s :tab-select')
config.bind('B', 'set-cmd-text :tab-select 0/')
config.bind('C', 'devtools')
# config.bind('F', None)
config.bind('Fd', 'hint all download')
config.bind('Ff', 'hint all tab')
config.bind('Fh', 'hint all hover')
config.bind('Fw', 'hint all window')
config.bind('G', 'scroll bottom')
config.bind('I', 'mode-enter passthrough')
config.bind('J', 'run-with-count 5 scroll down')
config.bind('K', 'run-with-count 5 scroll up')
config.bind('O', 'set-cmd-text -s :open')
# config.bind('Sb', None)
config.bind('sh', 'open -t qute://history')
config.bind('sq', 'open -t qute://bookmarks')
config.bind('ss', 'open -t qute://settings')
config.bind('st', 'config-cycle tabs.show always never')
config.bind('sc', 'spawn nvim-qt .config/qutebrowser/config.py')
config.bind('sC', 'config-source ;; message-info "READY!"')
config.bind('T', 'set-cmd-text -s :open -t')
config.bind('V', 'spawn --userscript view_in_mpv')
# config.unbind('B')
config.bind('sJ', 'set --pattern *://{url:host}/* content.javascript.enabled false ;; reload ;; message-info "JS OFF"')
config.bind('sj', 'set --pattern *://{url:host}/* content.javascript.enabled true ;; reload ;; message-info "JS ON"')
config.bind('sB', 'set --pattern *://{url:host}/* content.blocking.enabled false ;; reload ;; message-info "ADBLOCK OFF"')
config.bind('sb', 'set --pattern *://{url:host}/* content.blocking.enabled true ;; reload ;; message-info "ADBLOCK ON"')
config.bind('f', 'hint')
config.bind('g#', 'tab-focus last')
config.bind('gg', 'scroll top')
config.bind('gh', 'spawn --userscript nossl')
config.bind('gi', 'hint inputs')
config.bind('gp', 'tab-pin ;; tab-move 1')
config.bind('h', 'scroll left')
config.bind('j', 'scroll down')
config.bind('k', 'scroll up')
config.bind('l', 'scroll right')
config.bind('o', 'set-cmd-text -s :open -s')
config.bind('q', 'nop')
config.bind('qo', 'set-cmd-text -s :open -t o')
config.bind('t', 'set-cmd-text -s :open -t -s')
config.bind('wp', 'set-cmd-text -s :open -p')
config.bind('yf', 'hint all yank')
config.bind('<Ctrl+h>', 'rl-backward-char', mode='command')
config.bind('<Ctrl+j>', 'command-history-next', mode='command')
config.bind('<Ctrl+k>', 'command-history-prev', mode='command')
config.bind('<Ctrl+l>', 'rl-forward-char', mode='command')
config.bind('<Ctrl+h>', 'tab-prev', mode='insert')
config.bind('<Ctrl+l>', 'tab-next', mode='insert')
config.bind('<Ctrl+p>', 'insert-text {clipboard}', mode='insert')

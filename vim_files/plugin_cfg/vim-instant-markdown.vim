
" Minimal default configuration:

filetype plugin on
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1


" Configuration
" g:instant_markdown_slow
"
" By default, vim-instant-markdown will update the display in realtime. If that taxes your system too much, you can specify
"
" let g:instant_markdown_slow = 1
"
" before loading the plugin (for example place that in your ~/.vimrc). This will cause vim-instant-markdown to only refresh on the following events:
"
"     No keys have been pressed for a while
"     A while after you leave insert mode
"     You save the file being edited
"
" g:instant_markdown_autostart
"
" By default, vim-instant-markdown will automatically launch the preview window when you open a markdown file. If you want to manually control this behavior, you can specify
"
" let g:instant_markdown_autostart = 0
"
" in your .vimrc. You can always manually trigger preview via the command :InstantMarkdownPreview and stop it via :InstantMarkdownStop.
" g:instant_markdown_open_to_the_world
"
" By default, the server only listens on localhost. To make the server available to others in your network, edit your .vimrc and add
"
" let g:instant_markdown_open_to_the_world = 1
"
" Only use this setting on trusted networks!
" g:instant_markdown_allow_unsafe_content
"
" By default, scripts are blocked. To allow scripts to run, edit your .vimrc and add
"
" let g:instant_markdown_allow_unsafe_content = 1
"
" g:instant_markdown_allow_external_content
"
" By default, external resources such as images, stylesheets, frames and plugins are allowed. To block such content, edit your .vimrc and add
"
" let g:instant_markdown_allow_external_content = 0
"
" g:instant_markdown_logfile
"
" For troubleshooting, server startup and curl communication from Vim to the server can be logged into a file.
"
" let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"
" g:instant_markdown_mathjax
"
" By default, no TeX code embedded within markdown would be rendered. This option uses MathJax and launches the node server as instant-markdown-d --mathjax.
"
" let g:instant_markdown_mathjax = 1
"
" New in version instant-markdown-d==0.2.0
" g:instant_markdown_browser
"
" By default, browser is detected by instant-markdown-d depending on the OS. Starting with version instant-markdown-d>=0.2.0, you can set something like
"
let g:instant_markdown_browser = "firefox --new-window"
"
" New in version instant-markdown-d==0.2.0
" g:instant_markdown_port
"
" Choose a custom port instead of the default 8090.
"
" let g:instant_markdown_port = 8888
"
" New in version instant-markdown-d==0.2.0
" g:instant_markdown_autoscroll
"
" By default, with version instant-markdown-d>=0.2.0, the live preview auto-scrolls to where your cursor is positioned. To disable this behaviour, edit your .vimrc and add
"
" let g:instant_markdown_autoscroll = 0
"
" New in version instant-markdown-d==0.2.0
" Supported Platforms
"
" OSX, Unix/Linuxes*, and Windows**.
"
" *: One annoyance in Linux is that there's no way to reliably open a browser page in the background, so you'll likely have to manually refocus your vim session everytime you open a Markdown file. If you have ideas on how to address this I'd love to know!
"
" **: In Windows, there's no easy way to execute commands asynchronously without popping up a cmd.exe window. Thus, if you run this plugin without g:instant_markdown_slow, you might experience performance issues.
" FAQ
"
"     It's not working!
"
"     Make sure instant-markdown-d was installed as a global module (e.g. using npm -g install)
"     If you're on OSX and are using zsh, try to add set shell=bash\ -i in your .vimrc to set interactive bash as the default vim shell. (See this issue)
"
"     Why don't my <bla>.md files trigger this plugin?
"
" By default, vim versions before 7.4.480 only recognize files ending with .markdown, .mdown, and README.md as markdown files. If you want <anything>.md to be recognized, I recommend installing one of many markdown plugins available, such as this one.
"
" If you're curious, the code for the mini-server component for this plugin can be found at http://github.com/suan/instant-markdown-d. A plugin can easily be written for any editor to interface with the server to get the same functionality found here.


" vim-startify config {
" Show modified and untracked git files
" https://github.com/mhinz/vim-startify/wiki/Example-configurations

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" function s:foobar()
"     return [
"                 \ { 'line': 'foo', 'cmd': 'echo "FOO!"' },
"                 \ { 'line': 'bar', 'cmd': 'echo "BAR!"' },
"                 \ ]
" endfunction

let g:startify_sessions_dir = '~/.config/nvim/session'
let g:startify_files_number = 8     "default: 10
let g:startify_commits_max  = 5

function! s:list_commits()
    let git = 'git' " let git = 'git -C $DOTFILES_HOME'
    let commits = systemlist(git .' log --oneline | head -n' . g:startify_commits_max)
    let git = 'G'. git[1:]
    return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction


let g:startify_bookmarks = [
        \ {'b': '~/.bashrc'},
        \ {'c': "$DOTFILES_HOME/.config/qtile/config.py"},
        \ {'p': "$DOTFILES_HOME/vim_plugins.vim"},
        \ {'v': "$DOTFILES_HOME/.nvimrc_1"},
        \ ]

let g:startify_lists        = [
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': 'files',     'header': ['   Files (last ' . g:startify_files_number . ')']            },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ { 'header': ['   Commits (last ' . g:startify_commits_max . ')'],        'type': function('s:list_commits') },
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ ]
        " \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
        " \ { 'type': function('s:foobar'), 'header': ['foo', ' and', '  bar'] },

let g:startify_commands = [
        \ {'r': ['Vim Reference', 'h ref']},
        \ ]
        " \ ':help reference',
        " \ {'h': 'h ref'},
        " \ {'m': ['My magical function', 'call Magic()']},


" Usually |v:oldfiles| only gets updated when Vim exits. Using this option updates
" it on-the-fly, so that :Startify is always up-to-date.
let g:startify_update_oldfiles = 0

" If this option is enabled and you start Vim in a directory that contains a
" `Session.vim`, that session will be loaded automatically. Otherwise it will be
" shown as the top entry in the Startify buffer.
"
" The same happens when you |:cd| to a directory that contains a `Session.vim`
" and execute |:Startify|.
"
let g:startify_session_autoload = 1

" This is a list of commands to be executed before saving a session.
let g:startify_session_before_save = [
        \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeTabsClose'
        \ ]

" When opening a file or bookmark, seek and change to the root directory of the
" VCS (if there is one).
"
" At the moment only git, hg, bzr and svn are supported.
let g:startify_change_to_vcs_root = 0


" A list of Vim regular expressions that is used to filter recently used files.
" See |pattern.txt| for what patterns can be used.
"
" NOTE: Due to the nature of patterns, you can't just use "~/mysecret" but have
" to use "$HOME .'/mysecret.txt'". The former would do something entirely
" different: |/\~|. When using backslashes as path separators, escape them.
" Otherwise using "C:\this\vim\path\is\problematic" would not match what you
" expect, since |/\v| is a pattern, too.

let g:startify_skiplist = [
            \ '\.vimgolf',
            \ '^/tmp',
            \ '/project/.*/documentation',
            \ escape(fnamemodify($HOME, ':p'), '\') .'mysecret.txt',
            \ ]


" The number of spaces used for left padding.
let g:startify_padding_left = 3


" Show <empty buffer> and <quit>.
let g:startify_enable_special = 1


" The maximum number of sessions to display. Makes the most sense together with
" |g:startify_session_sort|.
"
" ------------------------------------------------------------------------------
let g:startify_session_number = 999

" Sort sessions by modification time (when the session files were written)
" rather than alphabetically.
let g:startify_session_sort = 0


" Use any list of strings as indices instead of increasing numbers. If there are
" more startify entries than actual items in the custom list, the remaining
" entries will be filled using the default numbering scheme starting from 0.
"
" Thus you can create your own indexing scheme that fits your keyboard layout.
" You don't want to leave the home row, do you?!
"
" Example:
" >
let g:startify_custom_indices = ['f', 'g', 'h']

let g:startify_custom_header = 'startify#pad(startify#fortune#cowsay())'

" Define your own header.
"
" This option takes a `list of strings`, whereas each string will be put on its
" own line. If it is a simple `string`, it should evaluate to a list of strings.
"
" Helper functions:~
"
"     startify#fortune#quote()       random quote
"     startify#fortune#boxed(...)    random quote in a box
"     startify#fortune#cowsay(...)   random quote in a box + cow
"
" The last two functions optionally take a quote in the list of strings format.
" They also return a list of strings, suitable for this option.
"
"     startify#pad([strings])        pad strings in list according to
"                                    |g:startify_padding_left| or the default of 3
"     startify#center([strings])     center list of strings without removing
"                                    its strings indentations
"
" Example #1:~
" >
"     let g:startify_custom_header = [
"             \ '                                 ________  __ __        ',
"             \ '            __                  /\_____  \/\ \\ \       ',
"             \ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \    ',
"             \ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_ ',
"             \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
"             \ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/  ',
"             \ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/    ',
"             \ ]
" <
" Example #2:~
" >
"     let g:startify_custom_header =
"             \ startify#pad(split(system('fortune | cowsay'), '\n'))
" <
" Example #3:~
"
" Let's assume you like the default boxed random quote, but not the ASCII art
" cow. You'd rather have another small ASCII art come before the quote. No
" problem!
" >
"     let g:ascii = [
"           \ '        __',
"           \ '.--.--.|__|.--------.',
"           \ '|  |  ||  ||        |',
"           \ ' \___/ |__||__|__|__|',
"           \ ''
"           \]
"     let g:startify_custom_header = g:ascii + startify#fortune#boxed()
" <
" Looks great! But it's not on the same column as the indices below which makes
" it look awkward. Let's indent the header by 3 spaces:
" >
"     let g:startify_custom_header =
"           \ startify#pad(g:ascii + startify#fortune#boxed())
" <
" Ah, much better! There's only one issue left. If you set
" g:startify_custom_header this way, it will only be done once. Hence spamming
" :Startify will always show the same quote.
"
" If you provide a string to it instead, Startify will evaluate it every time
" :Startify is run:
" >
"     let g:startify_custom_header =
"           \ 'startify#pad(g:ascii + startify#fortune#boxed())'
" <
" Happy customizing!
"
" Also have a look at |startify-faq-08|.
"
" ------------------------------------------------------------------------------
"                                                *g:startify_custom_header_quotes*
"
" If you don't set |g:startify_custom_header|, the internal cowsay implementation
" with predefined random quotes will be used.
"
" To use your own quotes, set this option to a list of quotes. Each quote is
" either another list or a |Funcref| (see |expr-lambda|) that returns a list.
"
" Each element of the inner lists is put on an own line in the custom header.
" >
"     let g:startify_custom_header_quotes = [
"         \ ['quote #1'],
"         \ ['quote #2', 'using', 'three lines'],
"         \ {-> systemlist('echo quote #3')}
"         \ ]
" <
" If you want the predefined quotes as well, use this:
" >
"   let g:startify_custom_header_quotes =
"       \ startify#fortune#predefined_quotes() + [['quote 1', 'quote 2']]
" <
" ------------------------------------------------------------------------------
"                                                       *g:startify_custom_footer*
" >
"     let g:startify_custom_footer = ''
" <
" Same as the custom header, but shown at the bottom of the startify buffer.
"
" ------------------------------------------------------------------------------
"                                                 *g:startify_disable_at_vimenter*
" >
let g:startify_disable_at_vimenter = 0
" <
" Don't run Startify at Vim startup. You can still call it anytime via
" :Startify.
"
" let g:startify_custom_indices = ['f', 'g', 'h']
" -----------------------------------------------------------------------------
" This would result in:
"
"     [f]  /most/recently/used/file1
"     [g]  /most/recently/used/file2
"     [h]  /most/recently/used/file3
"     [0]  /most/recently/used/file4
"     [1]  /most/recently/used/file5
"     [2]  /most/recently/used/file6
"     etc.
"
" If you want numbers to start at 1 instead of 0, you could use this:
" >
"     let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
" <
" NOTE: There is no sanitizing going on, so you should know what you're doing!
"       Avoid using keys from |startify-mappings|.
"
" ------------------------------------------------------------------------------
" endfor
" Delete all buffers when loading or closing a session:
"
"     - When using |startify-:SLoad|.
"     - When using |startify-:SClose|.
"     - When using |g:startify_session_autoload|.
"     - When choosing a session from the Startify buffer.
"
" NOTE: Buffers with unsaved changes are silently ignored.
let g:startify_session_delete_buffers = 1


" Automatically update sessions in two cases:
"
"     - Before leaving Vim
"     - Before loading a new session via :SLoad
"
" This also works for sessions started with:
" >
"     vim -S mysession.vim
let g:startify_session_persistence = 0
"
"
"
" vim-startify config }




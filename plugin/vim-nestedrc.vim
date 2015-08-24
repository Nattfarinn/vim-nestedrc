if (exists('g:loaded_nestedrc') && g:loaded_nestedrc)
    finish
endif
let g:loaded_nestedrc = 1

if (!exists('g:nestedrc_root_directory'))
    let g:nestedrc_root_directory = $HOME
endif

let s:nestedrc_cwd = getcwd()
let s:nestedrc_found = []

if (s:nestedrc_cwd =~ g:nestedrc_root_directory)
    while 1
        if (s:nestedrc_cwd != $HOME)
            if filereadable(s:nestedrc_cwd . '/.vimrc')
                let s:nestedrc_found += [s:nestedrc_cwd . '/.vimrc']
            endif
        endif
        if (s:nestedrc_cwd == g:nestedrc_root_directory)
            break
        endif
        let s:nestedrc_cwd = resolve(s:nestedrc_cwd . '/..')
    endwhile
endif

let s:nestedrc_found = reverse(s:nestedrc_found)
for vimrc in s:nestedrc_found
    exec 'source ' . vimrc
endfor

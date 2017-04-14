# vim-nestedrc
Reinventing the wheel: search parent folders for `.vimrc` files till `$HOME` (configurable) directory. Load every .vimrc found in reversed order to achieve inheritance. By default plugin ignores `$HOME/.vimrc` file (Vim will load it anyway in most of cases)

# Installation:
### Vundle
```
Plugin 'nattfarinn/vim-nestedrc'
```

# Configuration
Set root directory. Search won't go beyond this value.
```
let g:nested_root_directory = '/path/to/root'  " $HOME is default value 
```

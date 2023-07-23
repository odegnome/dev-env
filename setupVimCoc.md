# Instructions to setup CoC in VIM

## Make sure yarn is installed

```zsh
yarn --version
```

Use the following command if yarn is not found:

```zsh
npm install --global yarn
```

## Setup Vim-Plug
Best to refer to juengunn/vim-plug on github

```zsh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Setup CoC
Refer to [link](https://www.linuxfordevices.com/tutorials/linux/setup-coc-autocompletion-vim)

Basically, the following line needs to be added in **.vimrc**

```
call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim'
call plug#end()
```

## Setup necessary LSP
Execute the following from inside vim: `CocInstall <extension-name>`

### For rust:
```
:CocInstall coc-rust-analyzer
```

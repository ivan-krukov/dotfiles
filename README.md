# dotfiles

These are the configs that I have accumulated over the years.

They should be relatively platform independent.
The only expception is `zsh` config which includes some MacOS `iterm2` and `MacVIM` settings.

The dotfiles must be soft linked into their proper locations.

In general, this should suffice:

``` shell
cd ~
for f in tmux.conf vimrc zshrc; do
    ln -s dotfiles/$f ~/.$f
done
```

## VIM

There are some components that need to be installed separately.

The plugin manager of choice is [vimplug](https://github.com/junegunn/vim-plug).

For complete navigation zen, I am using [fzf](https://github.com/junegunn/fzf).

Completion library I am using is [YouCompleteMe](https://github.com/Valloric/YouCompleteMe), which also requires some external setup.

After these components are in place, everything should work smoothly.

#TODO

- [ ] comments
- [ ] test on several platforms
    - [x] MacOS

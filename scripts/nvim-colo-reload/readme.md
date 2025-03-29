# neovim-colo-reload

here 2 scripts are provided:
- neovim-colo-reload
- nvim-wrap

`neovim-colo-reload`: sends neovim commands into a pipe (by default `/tmp/nvim.pipe`) to reload
    color scheme, status line theme and any other setting you may want and can be reloaded, the
    script is made so that you can overwrite the functions `rel_colo` `rel_bar` `rel_other` in a way
    that fits your setup, take the script as an example of what can be done and go crazy!

`nvim-wrap`: a paper thin wrapper to ensure that every instance of neovim we launch will always be
    listening to the pipe that `neovim-colo-reload` sends commands to, you can use this file to set
    and unset environment variables if you want or to launch neovim with another wrapper, your
    imagination is the limit.

installation:
```sh
# just run
# by default this will put both scripts in:
#     $HOME/.local/bin
make install clean
```

have fun!!!

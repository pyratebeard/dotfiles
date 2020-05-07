```

    ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀░░
    ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█░░
    ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░░

    ABOUT     custom Linux configuration files
    AUTHOR    pyratebeard <root@pyratebeard.net>
    CODE      https://gitlab.com/pyratebeard/dotfiles

    2bwm            > window manager
    cmus            > music player
    dunst           > notification daemon
    irssi           > irc client
    gpg             > gpg agent config
    mpd             > audio player daemon
    mutt            > email client
    newsboat        > rss reader
    ncmpcpp         > ui for mpd
    tmux            > terminal multiplexer
    urxvt           > terminal emulator
    vim             > text editor
    zsh             > shell

```

### CONTENTS
 - [introduction](#dotfiles)
 - [managing](#managing)
 - [how to use](#using)
 - [terminal](#terminal)
 - [screenshots](#screenshots)
 - [citations](#citations)
 - [disclaimer](#disclaimer)

### DOTFILES

In the world of Linux everything is a file and you can create a incredibly personalised environment by modifying your dotfiles.

This is known as 'ricing' and can become very, very obsessive...

### MANAGING

I manage my dotfiles using [stow](http://www.gnu.org/software/stow/).  The stow package should be available in your preferred package manager.

### USING
Clone the repo into your home directory:

`git clone http://gitlab.com/pyratebeard/dotfiles.git ~/dotfiles`

Enter the dotfiles directory

`cd dotfiles`

Install the zsh settings

`stow zsh`

Install vim configuration

`stow vim`

Uninstall vim configuration

`stow -D vim`

etc...

### TERMINAL
Ever since I started using Linux I have loved working in the terminal. I find it faster and easier than most graphical interfaces.

I have tried a number of terminal emulators over the years but I'm currently using [urxvt](). I have recently started using [zsh](http://zsh.sourceforge.net/) over [bash](https://www.gnu.org/software/bash/) for my shell.

I've also come to love [tmux](https://tmux.github.io/) for running multiple sessions in one window.

Because I work in the terminal I try to use as many terminal based applications as I can. Here is a list of my current chosen apps:

APP | PKG
--- | ---
AUDIO | [ncmpcpp](http://rybczak.net/ncmpcpp/) ([mpd](https://www.musicpd.org/) backend)
IRC | [irssi](https://irssi.org/)
EMAIL | [mutt](http://www.mutt.org/)
RSS | [newsboat](https://newsboat.org/)
EDITOR | [vim](http://www.vim.org/)

Here are some other commands I run from the terminal:

APP | PKG
--- | ---
VIDEO PLAYER | [mpv](https://mpv.io/)
IMAGE VIEWER | [sxiv](https://github.com/muennich/sxiv)
SCREENSHOT | [scrot]()

### SCREENSHOTS

#### downtime theme
![](https://gitlab.com/pyratebeard/dotfiles/raw/master/scrots/downtime.png)
- zsh
- tmux
- vim
- cava
- rtv
- firefox

#### futuremyth theme
![](https://gitlab.com/pyratebeard/dotfiles/raw/master/scrots/futuremyth.png)
- zsh
- tmux
- vim
- cmus
- firefox

### CITATIONS
Thanks to all at [unixporn](http://reddit.com/r/unixporn) and [nixers](https://www.nixers.net/) for posting their setups and giving me ideas.

Also thanks to [xero](https://github.com/xero/dotfiles) for having such well documented dotfiles they enabled me to make an awesome set up, and it convinced me to release my files!

### DISCLAIMER
Feel free to clone or fork my repo but you use these files at your own risk!

I will be happy to receive details of any bugs.


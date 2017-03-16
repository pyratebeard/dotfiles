```
      __          __       ___      ___                    
     /\ \        /\ \__  /'___\ __ /\_ \                   
     \_\ \    ___\ \ ,_\/\ \__//\_\\//\ \      __    ____  
     /'_` \  / __`\ \ \/\ \ ,__\/\ \ \ \ \   /'__`\ /',__\ 
    /\ \L\ \/\ \L\ \ \ \_\ \ \_/\ \ \ \_\ \_/\  __//\__, `\
    \ \___,_\ \____/\ \__\\ \_\  \ \_\/\____\ \____\/\____/
     \/__,_ /\/___/  \/__/ \/_/   \/_/\/____/\/____/\/___/ 

    ABOUT     Custom Linux configuration files
    AUTHOR    pyratebeard <root@pyratebeard.net>
    CODE      https://github.com/pyratebeard/dotfiles

    awesome         > awesomewm config and collection of themes
    bash            > bash settings, aliases, and functions
    dwb             > dynamic web browser settings
    gtk             > mod of mist theme for gtk
    herbstluftwm    > 
    irssi           > custom irc settings
    moc             > music on console custom theme and settings
    mpd             > music player daemon setup
    mutt            > minimal mutt setup
    ncmpcpp         > ncurses mpc++ ui/color settings
    qutebrowser     >
    ranger          > file manager with image previews and z3bra theme
    sublime         > sublime text 2 and 3 with custom themes
    tmux            > terminal multiplexer with custom status bar
    urxvt           > various terminal colors and keyboard settings
    vim             > wizard status bar and sourcerer color scheme
    zsh             > zshell settings, aliases, and custom prompts

```

### Contents
 - [Introduction](#Dotfiles)
 - [Managing](#Managing)
 - [How to use](#Using)
 - [Terminal](#Terminal)
 - [Previews](#Previews)
 - [Citations](#Citations)
 - [Disclaimer](#Disclaimer)

### Dotfiles

In the world of Linux everything is a file and you can create a incredibly personalised environment by modifying your dotfiles.

This is known as 'ricing' and can become very, very obsessive...

### Managing

I manage my dotfiles using [stow](http://www.gnu.org/software/stow/).  The stow package should be available in your preferred package manager.

### Using
Clone the repo into your home directory:

`git clone http://github.com/pyratebeard/dotfiles.git ~`

Enter the dotfiles directory

`cd dotfiles`

Install the zsh settings

`stow zsh`

Install awesomewm configuration

`stow awesome`

Uninstall awesomewm configuration

`stow -D awesome`

etc...

### Terminal
Ever since I started using Linux I have loved working in the terminal. I find it faster and easier than most graphical interfaces.

I have tried a number of terminal emulators over the years but I'm currently using [urxvt](). I have recently started using [zsh](http://zsh.sourceforge.net/) over [bash](https://www.gnu.org/software/bash/) for my shell.

I've also come to love [tmux](https://tmux.github.io/) for running multiple sessions in one window.

Because I work in the terminal I try to use as many terminal based applications as I can. Here is a list of my current chosen apps:

 - AUDIO          = [ncmpcpp](http://rybczak.net/ncmpcpp/) ([mpd](https://www.musicpd.org/) backend)
 - IRC            = [irssi](https://irssi.org/)
 - TWITTER        = [turses](http://turses.readthedocs.io/en/latest/)
 - EMAIL          = [mutt](http://www.mutt.org/)
 - RSS            = [snownews](https://kiza.eu/software/snownews/)
 - EDITOR         = [vim](http://www.vim.org/)
 - FILE MANAGER   = [ranger](http://ranger.nongnu.org/)

Here are some other apps I run from the terminal:

 - VIDEO PLAYER   = [mpv](https://mpv.io/)
 - IMAGE VIEWER   = [sxiv]()
 - SCREENSHOT     = [scrot]()

### Previews
Coming soon..!
                                                            
### Citations
Thanks to all at [unixporn](http://reddit.com/r/unixporn) and [nixers](https://www.nixers.net/) for posting their setups and giving me ideas.

Also thanks to [xero](https://github.com/xero/dotfiles) for having such well documented dotfiles they enabled me to make an awesome set up, and it convinced me to release my files!

### Disclaimer
Feel free to clone or fork my repo but you use these files at your own risk!

I will be happy to receive details of any bugs.

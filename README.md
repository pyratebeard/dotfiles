```
      __          __       ___      ___                    
     /\ \        /\ \__  /'___\ __ /\_ \                   
     \_\ \    ___\ \ ,_\/\ \__//\_\\//\ \      __    ____  
     /'_` \  / __`\ \ \/\ \ ,__\/\ \ \ \ \   /'__`\ /',__\ 
    /\ \L\ \/\ \L\ \ \ \_\ \ \_/\ \ \ \_\ \_/\  __//\__, `\
    \ \___,_\ \____/\ \__\\ \_\  \ \_\/\____\ \____\/\____/
     \/__,_ /\/___/  \/__/ \/_/   \/_/\/____/\/____/\/___/ 

    about     custom linux config files
    author    pyratebeard <root@pyratebeard.net>
    code      http://code.pyratebeard.net/dotfiles

    awesome   > awesome wm config and collection of themes
    bash      > bash settings, aliases, and functions
    dwb       > dynamic web browser settings
    gtk       > mod of mist theme for gtk
    irssi     > custom irc settings
    moc       > music on console custom theme and settings
    mpd       > music player daemon setup
    mutt      > minimal mutt setup
    ncmpcpp   > ncurses mpc++ ui/color settings
    ranger    > file manager with image previews and z3bra theme
    sublime   > sublime text 2 and 3 with custom themes
    tmux      > terminal multiplexer with custom status bar
    urxvt     > various terminal colors and keyboard settings
    vim       > wizard status bar and sourcerer color scheme
    zsh       > zshell settings, aliases, and custom prompts

```

##contents
 - [introduction](#dotfiles)
 - [managing](#managing)
 - [how to use](#using)
 - [terminal](#terminal)
 - [previews](#previews)
 - [citations](#citations)
 - [disclaimer](#disclaimer)

#dotfiles
in the world of linux everything is a file and you can create a incredibly personalised environment by modifying your dotfiles.

this is known as 'ricing' and can become very, very obsessive...

#managing
i manage my dotfiles using [stow](http://www.gnu.org/software/stow/).  stow should be available in your preferred package manager.

#using
clone the repo into your home directory:

`git clone http://github.com/pyratebeard/dotfiles.git ~`

enter the dotfiles directory

`cd dotfiles`

install the zsh settings

`stow zsh`

install awesomewm theme

`stow awesome`

uninstall awesome theme

`stow -D awesome`

etc...

#terminal
ever since i started using linux i have loved working in the terminal. i find it faster and easier than most graphical interfaces.

i have tried a number of terminal emulators over the years but i'm currently using [urxvt](). i have recently started using [zsh](http://zsh.sourceforge.net/) over [bash](https://www.gnu.org/software/bash/) for my shell.

i've also come to love [tmux](https://tmux.github.io/) for running multiple sessions in one window.

because i work in the terminal i try to use as many terminal based apps as i can. here is a list of my current chosen apps:

 - audio          = [ncmpcpp](http://rybczak.net/ncmpcpp/) ([mpd]() backend)
 - irc            = [irssi]()
 - twitter        = [turses]()
 - email          = [mutt]()
 - rss            = [snownews]()
 - editor         = [vim]()
 - file manager   = [ranger]()

i also run other apps from the terminal

 - video player   = [mpv]()
 - image viewer   = [sxiv]()
 - screenshot     = [scrot]()

#previews
coming soon..!
                                                            
#citations
thanks to all at [unixporn](http://reddit.com/r/unixporn) and [nixers](https://www.nixers.net/) for posting their setups and giving me ideas.

also thanks to [xero](https://github.com/xero/dotfiles) for having such well documented dotfiles they enabled me to make an awesome set up, and it convinced me to release my files!

#disclaimer
feel free to clone or fork my repo but you use these files at your own risk!

i will be happy to receive details of any bugs.
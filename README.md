# Setup

This repository is all about setting up a new system for me or my friends, in particular setting up Vim and the commandline for taking notes or other work. The end product will look something like this:

![A hint of what's to come when this is all done](EndProduct.png)

but with additionally all the extra stuff that comes with UltiSnips. The knowledge required to figure this all out and make the snippet files, understanding how to use Git properly has (unfortunately) taken up many many tens of hours and the hope is that this page will make it easier to get it done quickly first time.

In order to make this work, you're going to need to set up a few things first, depending on your platform.

## Mac

In general, the process is a little simpler for a Mac as it is a Unix system ultimately and so a lot of things naturally run better.

If you're on an iMac, you're going to want to begin by installing Xcode's Command Line Tools. We aren't really going to be using them directly but occasionally other programs have them as a prerequisite.

```
xcode-select --install
```
That will probably take a while. Now we need to install **brew**, which will prove invaluable. 
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
```
The last line is probably unnecessary but we do it anyway. Now we're going to want to install a whole bunch of things with brew.
```
brew install vim python git node anaconda zsh toilet
```
This will take absolutely ages but it's going to be worth it as we use all these things regularly. We now perform
```
chsh -s /bin/zsh
```
which changes the main shell to zsh. After this, you'll probably want to restart your machine. When it has started again, open up a terminal and see if it says zsh is the default (if it isn't, it might give a prompt for how to fix this). Then go for
```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
and you should see Oh-My-Zsh being installed.

Then go get yourself `iTerm2`, as it has various features as a terminal that we like (especially the pane-splitting with `CMD-D`). At this point, you may as well as install [MacTex](https://www.tug.org/mactex/) and also Skim, the pdf viewer.

## Windows

First, make sure you have Windows updated to the latest version [though maybe stick with 10 for now :)].

Then, you will need to install [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install), which they have now remarkably simplified to a single command and then restart! At the same time, you may as well get the "Windows Terminal" from the Windows Store and set the default profile to Ubuntu. Recall that for strange reasons in Windows you often start, upon opening the terminal, in some strange virtual file location so you should probably ``cd ~`` to begin with. You now want to download and install the latest version of vcxsrv from [here](https://github.com/ArcticaProject/vcxsrv/releases). Then Vim into your `~/.bashrc` and append
```
export DISPLAY=`grep -oP "(?<=nameserver ).+" /etc/resolv.conf`:0.0
```
and turn on vcxsrv in the background. Exit and reenter the shell. You can try and see if your GUI is working according to the steps from [here](https://www.youtube.com/watch?v=6_mbd1hvUnE) and hopefully if it doesn't work originally, then the video will give a fix. Now we install *MikTex*, Ubuntu installation instructions of which can be found [here](https://miktex.org/download). It requires a few commands but shouldn't take too long. We can install `zathura` and `toilet` by typing
```
sudo apt-get install zathura toilet
```
which will act as our pdf viewer and a fun way for displaying ASCII text respectively. We now also install `zsh` by saying
```
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
and then restart the terminal. It should now look like zsh. 

## Finishing off both

We now finish both installations off. To finish installing the looks, we write
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```
and then open `~/.zshrc` and change `ZSH_THEME` to `"powerlevel10k/powerlevel10k"` (keep the quotes). After exiting out, you're going to want to restart your terminal and configure the theme. To get it to completely work on Windows, you'll want to download the MesloLGS NF font from [here](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k) (you can also mess around with the theme in the terminal settings).

Almost done! To set up your Git config, type in
```
git config —global user.name “First Last” (keep the quotes)
git config —global user.email “Email” (keep the quotes)
```
with your GitHub details (the email can be found in account settings). Finally, we clone this Git repository in home with
```
git clone https://github.com/n-simplex/setup.git ~/setup
```
and then check all the `.vimrc`, `.vim` things are all there. If they are, `mv` or `cp` all the relevant files:

* ``.vimrc`` into the Home directory (NOT THE ``.zshrc`` as this will mess up your OH MY ZSH installation location!)
* ``cp`` the whole ``.vim`` folder into the Home directory using the ``-R`` flag.

and then type `vim .vimrc` to see if your Vim install gives any errors. Hopefully, it shows all the lines correctly and looks at least somewhat colourful. If so, type `:PlugInstall` to see all the plugins install themselves on your computer.

## TiddlyWiki

The installation guide for TiddlyWiki is given [here](https://tiddlywiki.com/static/Installing%2520TiddlyWiki%2520on%2520Node.js.html) and should hopefully be uneventful. Historically, it has gone through without issue on Mac but npm has had issues installing on Windows so unfortunately may require some debugging. Having gone through the steps it should be clear if/that the installation works.

Now we want to clone two repositories, one for notes and one for the blog, which I won't link to here as they are private. Do this in some folder dedicated to TiddlyWiki things. Then, in the directory just above the notes and blog directories place the files `savenotes.sh`,`save.sh` and `art.txt`. If you are on Windows (i.e. implicitly Linux) you need to make both of these files executable with the commands
```
chmod +x save.sh
chmod +x savenotes.sh
```
and now we need to go into ``.zshrc`` and add the aliases for ``notesave, blogsave, notes`` with the correct directory locations by copying from the appropriate lines in the copy given in setup (in Windows it is not necessary to quote the lines referencing iTerm2).

Try running ``notesave`` as a test and if it works you should be done!

## TO DO

- Add support for a Linux setup (though this is kind of already done)

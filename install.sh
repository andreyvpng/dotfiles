echo 'Installing packages'
apt update
apt-get install curl stow vim zsh tmux

echo 'Installing oh-my-zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
stow zsh
stow .oh-my-zsh

echo 'Installing vim-plug'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
stow vim

echo 'Installing TPM'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
stow tmux

echo 'Installing colorscheme'
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

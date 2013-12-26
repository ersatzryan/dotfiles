for f in `find $( dirname "$BASH_SOURCE[0]" ) -name '*.ln'`; do
  filename=$(basename "$f")
  if [ -e "$HOME/.${filename%.ln}" ]
  then
    rm "$HOME/.${filename%.ln}"
  fi

  ln -s "$( greadlink -f "$f" )" "$HOME/.${filename%.ln}"
done

if type foo >/dev/null 2>&1; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew bundle ~/.brewfile
fi

vim -u ~/.vim/bundles.vim +BundleInstall +qall

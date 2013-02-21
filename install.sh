for f in `find $( dirname "$BASH_SOURCE[0]" ) -name '*.ln'`; do
  filename=$(basename "$f")
  ln -s "$f" "~/.${filename%.ln}"
done

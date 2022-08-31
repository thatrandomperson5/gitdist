# First time
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "Setting up..."
mv "$SCRIPT_DIR/dist/gitdist" "$SCRIPT_DIR/gitdist/gitdist"
mv "$SCRIPT_DIR/gitdist" "/usr/local/gitdist"
if [ $? != 0 ]; then
  mv "$SCRIPT_DIR/gitdist" "$( dirname $SCRIPT_DIR )/gdist"
  export PATH=$PATH:$( dirname $SCRIPT_DIR )/gdist
  export PATH=$PATH:$( dirname $SCRIPT_DIR )/gdist/files
else
  export PATH=$PATH:/usr/local/gitdist
  export PATH=$PATH:/usr/local/gitdist/files
fi
echo "Setup complete."
rm -r -f $SCRIPT_DIR
alias gdist="gitdist"
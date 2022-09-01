# Updater
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
UPPER="$( dirname "$SCRIPT_DIR" )"
echo "Updating gitdist"
rm "$UPPER/gitdist"
mv "$SCRIPT_DIR/gitdist" "$UPPER/gitdist"
echo "Updated gitdist"
rm $SCRIPT_DIR/setup.sh

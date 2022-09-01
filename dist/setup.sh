# Updater
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
upper = "$( dirname "$SCRIPT_DIR" )"
echo "Updating gitdist"
rm "$upper/gitdist"
mv "$SCRIPT_DIR/gitdist" "$upper/gitdist"
echo "Updated gitdist"

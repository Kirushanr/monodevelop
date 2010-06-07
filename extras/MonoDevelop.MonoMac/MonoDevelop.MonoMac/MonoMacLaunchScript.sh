 #!/bin/sh
# This file was auto-generated by MonoDevelop-Monobjc
 
# Get the directory containing this script.
APP_ROOT=$(cd "$(dirname "$0")"; pwd)
 
# Strip off 'Contents/MacOS', returning the bundle directory.
for ((i=0; i<2; i++)); do APP_ROOT="$(dirname "$APP_ROOT")"; done
APP_ROOT="${APP_ROOT/\/\/}"
 
CONTENTS_DIR="$APP_ROOT/Contents"
RESOURCES_PATH="$CONTENTS_DIR/Resources"
 
export DYLD_LIBRARY_PATH=$RESOURCES_PATH:$DYLD_LIBRARY_PATH
 
APP_NAME=`echo $0 | awk -F"/" '{ printf("%s", $NF); }'`
ASSEMBLY=`echo $0 | awk -F"/" '{ printf("%s.exe", $NF); }'`
 
# I don't know why this crazyness is required, but it doesn't work without.
MONO_BIN=`which mono`
MONO_OPTIONS="--debug"
EXEC_PATH="$APP_ROOT"/"$APP_NAME"
if [ -f "$EXEC_PATH" ]; then rm -f "$EXEC_PATH" ; fi
ln -s $MONO_BIN "$EXEC_PATH"
echo $EXEC_PATH >> /tmp/logme 
exec -a $APP_NAME "$EXEC_PATH" $MONO_OPTIONS "$RESOURCES_PATH"/"$ASSEMBLY"

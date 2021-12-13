git submodule init 
git submodule update


# Put depot_tools in the path
export PATH="${DEPOT_TOOLS_DIR}:${PATH}"

python2 skia/tools/git-sync-deps
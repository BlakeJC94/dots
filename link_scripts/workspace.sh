
mkdir -p $HOME/Workspace/projects
mkdir -p $HOME/Workspace/data
for DIR in "${WORKDIRS[@]}"; do
    ln -sf $HOME/Dropbox/Home-db/Workspace-db/$DIR $HOME/Workspace/$DIR
done

if ! [ -x "$(command -v jill)" ]; then
    curl -fsSL https://raw.githubusercontent.com/abelsiqueira/jill/main/jill.sh > ${HOME}/.local/opt/jill.sh
    chmod a+x  ${HOME}/.local/opt/jill.sh
    ln -sf ${HOME}/.local/opt/jill.sh ${HOME}/.local/bin/jill
fi
jill -y


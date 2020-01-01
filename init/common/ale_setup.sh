APT_INSTALL_LIST=(
	shellcheck
	cmigemo
	) 
PIP_INSTALL_LIST=(
	proselint
	vim-vint
	)
CARGO_INSTALL_LIST=(
	rustfmt
	racer
	)
NPM_INSTALL_LIST=(
	eslint
	htmlhint
	mdl
	proselint
	textlint
	textlint-rule-common-misspellings
	textlint-rule-date-weekday-mismatch
	textlint-rule-general-novel-style-ja
	textlint-rule-joyo-kanji
	textlint-rule-preset-ja-technical-writing
	textlint-rule-preset-jtf-style
	textlint-rule-prh
	textlint-rule-spellcheck-tech-word
	write-good
  bash-language-server
	)

for INSTALL in ${CARGO_INSTALL_LIST[@]}; do
    yes | sudo cargo install $INSTALL --global
done


for INSTALL in ${PIP_INSTALL_LIST[@]}; do
    yes | pip3 install $INSTALL --global
done

for INSTALL in ${NPM_INSTALL_LIST[@]}; do
    yes | sudo nmp install $INSTALL --global
done

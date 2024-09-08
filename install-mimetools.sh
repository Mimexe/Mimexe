# Install repository
{ set +x; } 2>/dev/null
echo "Downloading public key"
{ set -x; } 2>/dev/null
wget --quiet -O - https://repo.mimedev.fr/gpg-pubkey.asc | sudo tee /etc/apt/keyrings/mimetools-pubkey.asc > /dev/null

{ set +x; } 2>/dev/null
echo "Adding to apt sources"
{ set -x; } 2>/dev/null
echo "deb [signed-by=/etc/apt/keyrings/mimetools-pubkey.asc arch=$( dpkg --print-architecture )] https://repo.mimedev.fr $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mimetools.list > /dev/null

{ set +x; } 2>/dev/null
echo "Updating apt"
{ set -x; } 2>/dev/null
sudo apt update > /dev/null 2>&1

{ set +x; } 2>/dev/null
# Ask to install aliases (mkcd, .., ...)
read -p "Do you want to install the aliases? (y/n) " -n 1 -r < /dev/tty

echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing aliases"
cat <<EOF >> ~/.bashrc
# MimeTools aliases
mkcd () {
case "\\\$1" in
    */..|*/../) cd -- "\$1";;
    /*/../*) (cd "\${1%/../*}/.." && mkdir -p "./\${1##*/../}") && cd -- "\$1";;
    /*) mkdir -p "\$1" && cd "\$1";;
    */../*) (cd "./\${1%/../*}/.." && mkdir -p "./\${1##*/../}") && cd "./\$1";;
    ../*) (cd .. && mkdir -p "\${1#.}") && cd "\$1";;
    *) mkdir -p "./\$1" && cd "./\$1";;
esac
}
alias ..='cd ..'
alias ...='cd ../..'
# End of MimeTools aliases
EOF
fi
{ set +x; } 2>/dev/null
# Show these echo messages normally
echo
echo "Successfully installed MimeTools!"
echo "Use it with 'apt install mcjardl'"
echo "There is currently only mcjardl."
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Restart your terminal or run 'source ~/.bashrc' to use the aliases."
fi
echo

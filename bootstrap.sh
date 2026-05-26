#!/bin/sh

set -e # Any subsequent(*) commands which fail will cause the shell script to exit immediately

#load secrets into env variables
. "$(dirname "$0")/.secrets"

# make links
mkdir -p ~/.config/fish
mkdir -p ~/.config/ccstatusline
mkdir -p ~/.claude

ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
ln -sf ~/dotfiles/.config/fish/functions ~/.config/fish/
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.claude/settings.json ~/.claude/settings.json
ln -sf ~/dotfiles/.config/ccstatusline/settings.json ~/.config/ccstatusline/settings.json

# Replace any <PLACEHOLDER> tokens in the template with matching env vars
# e.g. <ATLASSIAN_TOKEN> → value of $ATLASSIAN_TOKEN
MCP_TEMPLATE=$(cat ~/dotfiles/.claude.json.template)

# Find all placeholders like <SOME_VAR> and substitute from environment
for placeholder in $(echo "$MCP_TEMPLATE" | grep -o '<[A-Z_]*>' | sort -u); do
    var_name=$(echo "$placeholder" | tr -d '<>')
    value=$(printenv "$var_name" || true)
    if [ -z "$value" ]; then
        echo "Error: $var_name is not set — cannot resolve placeholder $placeholder in MCP config." >&2
        exit 1
    fi
    safe_value=$(printf '%s' "$value" | sed 's/[&\]/\\&/g')
    MCP_TEMPLATE=$(echo "$MCP_TEMPLATE" | sed "s|$placeholder|$safe_value|g")
done

MCP_TEMPLATE=$(echo "$MCP_TEMPLATE" | jq '{mcpServers: .mcpServers}')

tmp=$(mktemp)
if [ -f ~/.claude.json ]; then
    jq --argjson tpl "$MCP_TEMPLATE" '. * $tpl' ~/.claude.json > "$tmp"
else
    echo "$MCP_TEMPLATE" > "$tmp"
fi
jq empty "$tmp"
mv "$tmp" ~/.claude.json

echo "Successfully updated dotfiles!"

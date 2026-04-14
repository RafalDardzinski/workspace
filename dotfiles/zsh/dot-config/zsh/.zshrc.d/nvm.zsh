if [[ -f "/usr/share/nvm/init-nvm.sh" ]]; then
  source "/usr/share/nvm/init-nvm.sh"
  return
fi

if [[ -f "/opt/homebrew/opt/nvm/nvm.sh" ]]; then
  source "/opt/homebrew/opt/nvm/nvm.sh"
  return
fi

echo "NVM is not found" >&2

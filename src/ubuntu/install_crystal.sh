if [ ! -x "$(command -v crystal)" ]; then
  curl -sSL https://dist.crystal-lang.org/apt/setup.sh | sudo bash
fi

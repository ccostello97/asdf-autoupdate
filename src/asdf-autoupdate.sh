#!/bin/bash

plugins=$(asdf plugin list)

for plugin in $plugins; do
  current_version=$(asdf current $plugin | awk '{print $2}')
  latest_version=$(asdf latest $plugin)

  if [ "$current_version" != "$latest_version" ]; then
    echo "Updating $plugin global version from $current_version to $latest_version"
    asdf install $plugin $latest_version
    asdf global $plugin $latest_version
  else
    echo "No update available for $plugin"
  fi
done

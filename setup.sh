#!/bin/bash

# variables
green=`tput setaf 2`

if type brew
then
  ${green};echo ">>> Skip installing Homebrew..."
else
  echo ">>> Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if type carthage
then
  echo ">>> Skip installing Carthage..."
else
  echo ">>> Installing Carthage..."
  brew update && brew install carthage
fi

if type swiftlint
then
  echo ">>> Skip installing Swiftlint..."
else
  echo ">>> Installing Swiftlint..."
  brew update && brew install swiftlint
fi

echo "Installing dependancies..."
carthage update --platform iOS --no-use-binaries --cache-builds
#echo "Opening project by Xcode..."
#open ./VFAFaceID.xcodeproj

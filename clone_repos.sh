#!/bin/bash

# Function to ask which branch user wants to checkout
ask_branch() {
  read -p "Branch to checkout: " branch_name
}

# Function to clone repositories
clone_repositories() {
  if command -v gh &> /dev/null
  then
    gh repo clone git@github.com:vrsoftbr/VRMaster.git
    gh repo clone git@github.com:vrsoftbr/VRConnect.git
    gh repo clone git@github.com:vrsoftbr/VRCore.git
    gh repo clone git@github.com:vrsoftbr/VRNFe.git
    gh repo clone git@github.com:vrsoftbr/VRFramework.git
    gh repo clone git@github.com:vrsoftbr/VRWorkflow.git
  else
    git clone git@github.com:vrsoftbr/VRMaster.git
    git clone git@github.com:vrsoftbr/VRConnect.git
    git clone git@github.com:vrsoftbr/VRCore.git
    git clone git@github.com:vrsoftbr/VRNFe.git
    git clone git@github.com:vrsoftbr/VRFramework.git
    git clone git@github.com:vrsoftbr/VRWorkflow.git
  fi
}

# Function to checkout branch in all repositories
checkout_branch() {
  cd VRMaster
  git checkout $branch_name

  cd ../VRConnect
  git checkout $branch_name

  cd ../VRCore
  git checkout $branch_name

  cd ../VRNFe
  git checkout $branch_name

  cd ../VRFramework
  git checkout $branch_name

  cd ../VRWorkflow
  git checkout $branch_name
}

# Function to update branches
pull_all() {
  cd VRMaster
  git pull --all

  cd ../VRConnect
  git pull --all

  cd ../VRCore
  git pull --all

  cd ../VRNFe
  git pull --all

  cd ../VRFramework
  git pull --all

  cd ../VRWorkflow
  git pull --all
}

# Prompt the user for the desired action
echo "O que você deseja fazer?"
echo "[1] CLONE repos"
echo "[2] CHECKOUT repos"
echo "[3] CLONE and CHECKOUT repos"
echo "[4] PULL all changes from UPSTREAM"
read -p "Digite o número da sua escolha: " choice

case $choice in
  1)
    clone_repositories
    ;;
  2)
    ask_branch
    checkout_branch
    ;;
  3)
    ask_branch
    clone_repositories
    checkout_branch
    ;;
  4)
    pull_all
    ;;
  *)
    echo "Escolha inválida. Saindo."
    exit 1
    ;;
esac

#!/bin/bash

# Function to clone repositories
clone_repositories() {
  gh repo clone git@github.com:vrsoftbr/VRMaster.git
  gh repo clone git@github.com:vrsoftbr/VRConnect.git
  gh repo clone git@github.com:vrsoftbr/VRCore.git
  gh repo clone git@github.com:vrsoftbr/VRNFe.git
  gh repo clone git@github.com:vrsoftbr/VRFramework.git
  gh repo clone git@github.com:vrsoftbr/VRWorkflow.git
}

# Function to checkout branch in all repositories
checkout_branch() {
  read -p "Digite o nome do branch que você deseja fazer checkout: " branch_name

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

# Prompt the user for the desired action
echo "O que você deseja fazer?"
echo "1. Clonar repositórios"
echo "2. Fazer checkout do branch em todos os repositórios"
echo "3. Clonar repositórios e depois fazer checkout do branch em todos os repositórios"
read -p "Digite o número da sua escolha: " choice

case $choice in
  1)
    clone_repositories
    ;;
  2)
    checkout_branch
    ;;
  3)
    clone_repositories
    checkout_branch
    ;;
  *)
    echo "Escolha inválida. Saindo."
    exit 1
    ;;
esac

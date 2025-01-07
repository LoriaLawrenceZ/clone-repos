#!/bin/bash

# Function to ask which branch user wants to checkout
ask_branch() {
  read -p "Branch to checkout: " branch_name
}

# Function to ask which branch user wants to update from
ask_update_branch() {
  read -p "Branch to update from: " update_branch_name
}

# Function to ask which branch user wants to create from
ask_create_branch() {
  read -p "Branch to create from: " create_branch_name
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

# Function to create branches from existing ones
create_branch() {
  read -p "New branch name: " new_branch_name
  cd VRMaster
  git checkout -b $new_branch_name $create_branch_name
  git push --set-upstream origin $new_branch_name

  cd ../VRConnect
  git checkout -b $new_branch_name $create_branch_name
  git push --set-upstream origin $new_branch_name

  cd ../VRCore
  git checkout -b $new_branch_name $create_branch_name
  git push --set-upstream origin $new_branch_name

  cd ../VRNFe
  git checkout -b $new_branch_name $create_branch_name
  git push --set-upstream origin $new_branch_name

  cd ../VRFramework
  git checkout -b $new_branch_name $create_branch_name
  git push --set-upstream origin $new_branch_name

  cd ../VRWorkflow
  git checkout -b $new_branch_name $create_branch_name
  git push --set-upstream origin $new_branch_name
}

# Function to update local branches from remote using its upstream or another branch
update_branch() {
  cd VRMaster
  git pull origin $update_branch_name

  cd ../VRConnect
  git pull origin $update_branch_name

  cd ../VRCore
  git pull origin $update_branch_name

  cd ../VRNFe
  git pull origin $update_branch_name

  cd ../VRFramework
  git pull origin $update_branch_name

  cd ../VRWorkflow
  git pull origin $update_branch_name
}

# Prompt the user for the desired action
echo "What would you like to do?"
echo "[1] Clone repositories"
echo "[2] Checkout branch in repositories"
echo "[3] Clone and checkout branch in repositories"
echo "[4] Pull all changes from upstream"
echo "[5] Create new branch from existing one"
echo "[6] Update local branch from remote"
read -p "Enter the number of your choice: " choice

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
  5)
    ask_create_branch
    create_branch
    ;;
  6)
    ask_update_branch
    update_branch
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac

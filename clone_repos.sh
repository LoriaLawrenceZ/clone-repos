#!/bin/bash

# Function to print a header with a title
print_header() {
  echo -e "\033[1;34m"
  echo "=============================="
  echo "       CLONE REPOS TOOL       "
  echo "=============================="
  echo -e "\033[0m"
}

# Function to print a footer with a message
print_footer() {
  echo -e "\033[1;34m"
  echo "=============================="
  echo "         OPERATION DONE       "
  echo "=============================="
  echo -e "\033[0m"
}

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

# Print header
print_header

# Prompt the user for the desired action
echo -e "\033[1;32mWhat would you like to do?\033[0m"
echo -e "\033[1;33m[1] Clone repositories\033[0m"
echo -e "\033[1;33m[2] Checkout branch in repositories\033[0m"
echo -e "\033[1;33m[3] Clone and checkout branch in repositories\033[0m"
echo -e "\033[1;33m[4] Pull all changes from upstream\033[0m"
echo -e "\033[1;33m[5] Create new branch from existing one\033[0m"
echo -e "\033[1;33m[6] Update local branch from remote\033[0m"
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
    echo -e "\033[1;31mInvalid choice. Exiting.\033[0m"
    exit 1
    ;;
esac

# Print footer
print_footer

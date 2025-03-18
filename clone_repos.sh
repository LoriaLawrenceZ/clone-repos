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
    echo -e "\033[1;36mCloning VRMaster repository...\033[0m"
    gh repo clone git@github.com:vrsoftbr/VRMaster.git
    echo -e "\033[1;36mCloning VRConnect repository...\033[0m"
    gh repo clone git@github.com:vrsoftbr/VRConnect.git
    echo -e "\033[1;36mCloning VRCore repository...\033[0m"
    gh repo clone git@github.com:vrsoftbr/VRCore.git
    echo -e "\033[1;36mCloning VRNFe repository...\033[0m"
    gh repo clone git@github.com:vrsoftbr/VRNFe.git
    echo -e "\033[1;36mCloning VRFramework repository...\033[0m"
    gh repo clone git@github.com:vrsoftbr/VRFramework.git
    echo -e "\033[1;36mCloning VRWorkflow repository...\033[0m"
    gh repo clone git@github.com:vrsoftbr/VRWorkflow.git
  else
    echo -e "\033[1;36mCloning VRMaster repository...\033[0m"
    git clone git@github.com:vrsoftbr/VRMaster.git
    echo -e "\033[1;36mCloning VRConnect repository...\033[0m"
    git clone git@github.com:vrsoftbr/VRConnect.git
    echo -e "\033[1;36mCloning VRCore repository...\033[0m"
    git clone git@github.com:vrsoftbr/VRCore.git
    echo -e "\033[1;36mCloning VRNFe repository...\033[0m"
    git clone git@github.com:vrsoftbr/VRNFe.git
    echo -e "\033[1;36mCloning VRFramework repository...\033[0m"
    git clone git@github.com:vrsoftbr/VRFramework.git
    echo -e "\033[1;36mCloning VRWorkflow repository...\033[0m"
    git clone git@github.com:vrsoftbr/VRWorkflow.git
  fi
}

# Function to checkout branch in all repositories
checkout_branch() {
  echo -e "\033[1;36mChecking out branch $branch_name in VRMaster repository...\033[0m"
  cd VRMaster
  git checkout $branch_name

  echo -e "\033[1;36mChecking out branch $branch_name in VRConnect repository...\033[0m"
  cd ../VRConnect
  git checkout $branch_name

  echo -e "\033[1;36mChecking out branch $branch_name in VRCore repository...\033[0m"
  cd ../VRCore
  git checkout $branch_name

  echo -e "\033[1;36mChecking out branch $branch_name in VRNFe repository...\033[0m"
  cd ../VRNFe
  git checkout $branch_name

  echo -e "\033[1;36mChecking out branch $branch_name in VRFramework repository...\033[0m"
  cd ../VRFramework
  git checkout $branch_name

  echo -e "\033[1;36mChecking out branch $branch_name in VRWorkflow repository...\033[0m"
  cd ../VRWorkflow
  git checkout $branch_name
}

# Function to update branches
pull_all() {
  echo -e "\033[1;36mPulling all changes in VRMaster repository...\033[0m"
  cd VRMaster
  git pull --all

  echo -e "\033[1;36mPulling all changes in VRConnect repository...\033[0m"
  cd ../VRConnect
  git pull --all

  echo -e "\033[1;36mPulling all changes in VRCore repository...\033[0m"
  cd ../VRCore
  git pull --all

  echo -e "\033[1;36mPulling all changes in VRNFe repository...\033[0m"
  cd ../VRNFe
  git pull --all

  echo -e "\033[1;36mPulling all changes in VRFramework repository...\033[0m"
  cd ../VRFramework
  git pull --all

  echo -e "\033[1;36mPulling all changes in VRWorkflow repository...\033[0m"
  cd ../VRWorkflow
  git pull --all
}

# Function to create branches from existing ones
create_branch() {
  read -p "New branch name: " new_branch_name
  echo -e "\033[1;36mCreating branch $new_branch_name from $create_branch_name in VRMaster repository...\033[0m"
  cd VRMaster
  git checkout -b $new_branch_name $create_branch_name

  echo -e "\033[1;36mCreating branch $new_branch_name from $create_branch_name in VRConnect repository...\033[0m"
  cd ../VRConnect
  git checkout -b $new_branch_name $create_branch_name

  echo -e "\033[1;36mCreating branch $new_branch_name from $create_branch_name in VRCore repository...\033[0m"
  cd ../VRCore
  git checkout -b $new_branch_name $create_branch_name

  echo -e "\033[1;36mCreating branch $new_branch_name from $create_branch_name in VRNFe repository...\033[0m"
  cd ../VRNFe
  git checkout -b $new_branch_name $create_branch_name

  echo -e "\033[1;36mCreating branch $new_branch_name from $create_branch_name in VRFramework repository...\033[0m"
  cd ../VRFramework
  git checkout -b $new_branch_name $create_branch_name

  echo -e "\033[1;36mCreating branch $new_branch_name from $create_branch_name in VRWorkflow repository...\033[0m"
  cd ../VRWorkflow
  git checkout -b $new_branch_name $create_branch_name
}

# Function to update local branches from remote using its upstream or another branch
update_branch() {
  echo -e "\033[1;36mUpdating branch $update_branch_name in VRMaster repository...\033[0m"
  cd VRMaster
  git pull origin $update_branch_name

  echo -e "\033[1;36mUpdating branch $update_branch_name in VRConnect repository...\033[0m"
  cd ../VRConnect
  git pull origin $update_branch_name

  echo -e "\033[1;36mUpdating branch $update_branch_name in VRCore repository...\033[0m"
  cd ../VRCore
  git pull origin $update_branch_name

  echo -e "\033[1;36mUpdating branch $update_branch_name in VRNFe repository...\033[0m"
  cd ../VRNFe
  git pull origin $update_branch_name

  echo -e "\033[1;36mUpdating branch $update_branch_name in VRFramework repository...\033[0m"
  cd ../VRFramework
  git pull origin $update_branch_name

  echo -e "\033[1;36mUpdating branch $update_branch_name in VRWorkflow repository...\033[0m"
  cd ../VRWorkflow
  git pull origin $update_branch_name
}

# Function to list altered archives and their status
list_altered_archives() {
  for repo in VRMaster VRConnect VRCore VRNFe VRFramework VRWorkflow; do
    echo -e "\033[1;36mListing altered archives in $repo repository...\033[0m"
    cd $repo
    git status --short
    cd ..
  done
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
echo -e "\033[1;33m[7] List altered archives and their status\033[0m"
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
  7)
    list_altered_archives
    ;;
  *)
    echo -e "\033[1;31mInvalid choice. Exiting.\033[0m"
    exit 1
    ;;
esac

# Print footer
print_footer

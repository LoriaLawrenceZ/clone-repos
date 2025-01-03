#!/bin/bash

# Prompt the user for the branch name
read -p "Enter the branch name you want to checkout: " branch_name

# Clone the repositories
gh repo clone git@github.com:vrsoftbr/VRMaster.git
gh repo clone git@github.com:vrsoftbr/VRConnect.git
gh repo clone git@github.com:vrsoftbr/VRCore.git
gh repo clone git@github.com:vrsoftbr/VRNFe.git
gh repo clone git@github.com:vrsoftbr/VRFramework.git
gh repo clone git@github.com:vrsoftbr/VRWorkflow.git

# Navigate into each repository and checkout the specified branch
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

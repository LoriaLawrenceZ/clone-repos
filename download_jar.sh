#!/bin/bash

# Check if Python is installed
if ! command -v python &> /dev/null
then
    echo "Python could not be found. Would you like to install it? (yes/no)"
    read install_python
    if [ "$install_python" == "yes" ]; then
        echo "Please install Python from the Microsoft Store or disable this shortcut from Settings > Manage App Execution Aliases."
        exit
    else
        echo "Please install Python before running this script."
        exit
    fi
fi

# Check if gsutil is installed
if ! command -v gsutil &> /dev/null
then
    echo "gsutil could not be found. Would you like to install it? (yes/no)"
    read install_gsutil
    if [ "$install_gsutil" == "yes" ]; then
        # Install gsutil
        curl https://sdk.cloud.google.com | bash
        exec -l $SHELL
        gcloud components install gsutil
    else
        echo "Please install gsutil before running this script."
        exit
    fi
fi

# Download the .jar file from the Google bucket
gsutil cp gs://vr_4_4/VRMaster.jar .

# Inform the user that the download is complete
echo "Download complete."

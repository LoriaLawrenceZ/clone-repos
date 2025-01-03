#!/bin/bash

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
gsutil cp gs://<bucket-name>/<file-name>.jar .

# Inform the user that the download is complete
echo "Download complete."

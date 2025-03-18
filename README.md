This repository is empty. Any task executed on it should be considered a new capability and needs to be created.

## download_jar.sh

The `download_jar.sh` script is used to download a specific `.jar` file from a Google bucket.

### How to run the script

1. Ensure you have `gsutil` installed and configured on your system.
2. Ensure you have Python installed on your system.
3. Open a terminal.
4. Navigate to the directory containing the `download_jar.sh` script.
5. Run the script using the following command:
   ```
   ./download_jar.sh
   ```
6. The script will download the specified `.jar` file from the Google bucket `vr_4_4` and inform you when the download is complete.

### How to install Python

If you do not have Python installed, you can install it by following these steps:

1. Open the Microsoft Store.
2. Search for "Python".
3. Select the latest version of Python and click "Get" to install it.
4. Follow the on-screen instructions to complete the installation.
5. Verify the installation by running:
   ```
   python --version
   ```

### How to install gsutil

If you do not have `gsutil` installed, you can install it by following these steps:

1. Install the Google Cloud SDK by following the instructions at https://cloud.google.com/sdk/docs/install.
2. After installing the SDK, run the following command to install `gsutil`:
   ```
   gcloud components install gsutil
   ```
3. Verify the installation by running:
   ```
   gsutil version
   ```

## clone_repos.sh

The `clone_repos.sh` script is used to clone multiple repositories, checkout branches, pull changes, create new branches, and update local branches from remote.

### New Features

The script now includes the following new features:

1. **Colorful Output**: The script uses ANSI escape codes to add color to the echo statements, making the output more visually appealing.
2. **Header and Footer**: The script prints a header with a title at the beginning and a footer with a message at the end, providing a more structured and professional look.
3. **Centralized and Captivating Prompts**: The prompt messages have been updated to be more centralized and captivating, enhancing the user experience.
4. **Verbose Output**: The script now displays more verbose output during operations, including showing the affected repository in a different color.
5. **List Altered Archives**: The script now includes an option to list altered archives and their status (added or not to the stage) and the repository location.

### How to run the script

1. Open a terminal.
2. Navigate to the directory containing the `clone_repos.sh` script.
3. Run the script using the following command:
   ```
   ./clone_repos.sh
   ```
4. Follow the on-screen prompts to perform the desired actions.

### Example Usage

1. To clone the repositories, select option `[1] Clone repositories`.
2. To checkout a branch in all repositories, select option `[2] Checkout branch in repositories` and enter the branch name when prompted.
3. To clone and checkout a branch in all repositories, select option `[3] Clone and checkout branch in repositories` and enter the branch name when prompted.
4. To pull all changes from upstream, select option `[4] Pull all changes from upstream`.
5. To create a new branch from an existing one, select option `[5] Create new branch from existing one` and enter the branch name when prompted.
6. To update a local branch from remote, select option `[6] Update local branch from remote` and enter the branch name when prompted.
7. To list altered archives and their status, select option `[7] List altered archives and their status`.

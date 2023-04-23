# Download Files from URL List

This repository contains two scripts, `download_file.sh` and `script.sh`, to download files from a list of URLs in a text file. The scripts use `curl` and `grep`, please ensure they are installed on your system.

The script will then download the files from the listed URLs, and save them using the original file names in the directory where the scripts reside. The downloads will be performed in parallel, with up to 4 downloads at a time.

In the `xargs` command:

`-I {}` specifies a placeholder for the URL.
`-P 4` specifies the number of concurrent processes to run (in this case, 4).
`-n 1` specifies that only one URL should be passed to each instance of download_file.sh.

You can adjust the -P parameter to a higher or lower number depending on your internet connection and system resources. Note that increasing the number of parallel downloads may put more stress on your system and network, so choose a suitable value according to your setup.

Remember to make both scripts executable.

Finally, run your script.sh with the input file as usual:

`./script.sh input.txt`

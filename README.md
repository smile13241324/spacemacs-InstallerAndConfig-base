# spacemacs-InstallerAndConfig-Haskell

This is an integrated spacemacs development environment containing a full fledged
Haskell setup.

This has been separated from the [main image](https://github.com/smile13241324/spacemacs-InstallerAndConfig) due
to increasing build times for the Haskell dependencies.

If you are not interested in Haskell development it would be best to use the base image.

*Note:* Unfortunately this image does not contain a pre-build binary of hie
the Haskell LSP server. As building it during the container creation takes longer than 4
hours, exceeding the max build time on the docker cloud.

Therefore building hie in the container manually is required before it can be used.
How this is done can be found in `spacemacsAutoInstall_manjaro.sh` just copy paste
the commands in bash in your container. As the home dir is persisted you only need
to do this once.

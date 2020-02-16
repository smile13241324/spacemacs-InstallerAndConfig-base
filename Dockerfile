FROM smile13241324/spacemacs-InstallerAndConfig
LABEL Description="This image creates the basis for a dockerized version of spacemacs with strong Haskell support." Vendor="smile13241324@gmail.com" Version="1.0"
RUN ./spacemacsAutoInstall_manjaro.sh

# Keep the default volumes, ports and cmd

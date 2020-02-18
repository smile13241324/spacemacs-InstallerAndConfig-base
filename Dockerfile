FROM smile13241324/spacemacs-InstallerAndConfig
LABEL Description="This image creates a dockerized version of spacemacs with strong Haskell development support." Vendor="smile13241324@gmail.com" Version="1.0"
RUN ./spacemacsAutoInstall_manjaro.sh \
  && rm "${HOME}/.spacemacsInstall" -R

# Keep the default volumes, ports and cmd

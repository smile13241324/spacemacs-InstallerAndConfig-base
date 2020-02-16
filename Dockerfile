FROM jonathonf/manjaro
LABEL Description="This image creates the basis for a dockerized version of spacemacs by installing the OS level dependencies. It also runs an ssh server for secure X forwarding accepting only public key authentification. To use it add your public key to ~/.ssh/authorized_keys" Vendor="smile13241324@gmail.com" Version="1.0"
COPY . /installRepo
WORKDIR /installRepo
RUN ./spacemacsAutoInstall_manjaro.sh "sudoRun" \
  && sed -i 's/#X11Forwarding.*/X11Forwarding yes/' /etc/ssh/sshd_config \
  && sed -i 's/#X11UseLocalhost.*/X11UseLocalhost no/' /etc/ssh/sshd_config \
  && sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config \
  && sed -i 's/#PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config \
  && sed -i 's/UsePAM.*/UsePAM yes/' /etc/ssh/sshd_config \
  && sed -i 's/#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config \
  && ssh-keygen -A \
  && useradd -m spacemacs -U

# Persist the host key directory for easy replacement of standard container keys
VOLUME /etc/ssh

Install ssh authentication with GPG
========

* Create keys on the card

* create _gpg-agent.conf_ with:

enable-ssh-support

* Obtain keygrip authentication key :

gpg -K --with-keygrip

* create _sshcontrol_ with inside the keygrip of the Authentication key

* Move your _.ssh_ somewhere else

* Create the public ssh key for your gpg authentication key:

ssh-add -l
ssd-add -L > ~/.card_ssh_rsa.pub

* Move .card_ssh_rsa.pub on the server and add it to the authorized_keys

* Save the previous .ssh with the previous keys somewhere else safe

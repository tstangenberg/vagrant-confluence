vagrant-stash
=============

Instant provisioning of [Atlassian's Confluence (version 5.3.1)][1] with the help of [Vagrant][2] & [Puppet][3] 

What will it do?
----------------

1. Download Ubuntu 12.04
1. Create a new virtual machine, install Ubuntu and forward port 8080
1. Inside the virtual machine 
  1. Download & Install [Java][6]
  1. Download & Install & Start [Confluence][1]
 
Do it!
------

1. Install [VirtualBox][4] and [Vagrant][2] and make sure you have [git][5] available.
1. Open your favorite terminal (mine is [iTerm2][7]) and clone the github repository 

```
git clone --recursive https://github.com/tstangenberg/vagrant-confluence.git
cd vagrant-confluence
```

1. Start up and provision automatically all dependencies in the vm
	`vagrant up --provision` 
1. *** You're almost DONE! *** --> open the [confluence setup page][8] (http://localhost:8080/setup) & configure it



[1]: https://www.atlassian.com/software/confluence/overview
[2]: http://www.vagrantup.com/
[3]: http://puppetlabs.com/
[4]: https://www.virtualbox.org 
[5]: http://git-scm.com
[6]: http://jdk7.java.net
[7]: http://www.iterm2.com
[8]: http://localhost:8080

FritzBox VPN Configuration Generator
=============


Introduction
------------------
For the task of making it easier to generate configuration files for the integrated VPN server of your (and mine) FritzBox i wrote this short script. I hope its helpful if you are trying to open up a VPN server on your FritzBox.

Usage:
  * Make sure you install "dialog","sed","vpnc","network-manager-vpnc-gnome" and "network-manager-vpnc"
  * Execute fritzvpn.sh 
  * Just answer the questions
  * Import the configuration to your FritzBox
  * Import the configuration to your Network-Manager
  * Edit the routes of the imported profile in your Networkmanager -> uncheck "Use this connection only for resources on its network"

IMPORTED:
  * Passwords are stored in plain text in the configuration for your Network-Manager, due you have to keep it, don't choose a password you already used
  * You can't try the vpn connection from withing the network your FritzBox is in. Use your phone or something
  * Don't move the *.pcf file after importing or you're no longer able to use it
  * It might take up to 2min till you are able to connect to your new vpn


License
------------------
Everything is published under the BSD License


Disclaimer
------------------
This code works and so it should for you. I dont't give any kind of guarantee of completeness or accuracy.

# PLIoRS (Portable Linux Installer of Reverse Shells)

i made this thing to hack my classmates' asses in compsci classes

requires bash (no way), minimal usage steps:
- edit `.pliors.sh` to use your local ip instead of `10.4.13.13`
- run `SETUP.sh` from a usb stick/with any other way on the target pc with all scripts in the same directory. input a port you want to listen on, a device name for differentiating and gg, it's set up. the script sets up a cronjob and retries the connection to your machine every 10 seconds via bash (you can edit the reverse shell itself ofc)
- to uninstall, run `UNINSTALL.sh` on the target machine. the target port will be removed from a list of saved ports automatically, however it obviously only updates the port list **in the same directory `UNINSTALL.sh` is ran from**, so make sure to clean `ports.txt` up if you uninstall remotely

## Updating
to update from v1 to v2 there is a convenience `v1UNINSTALL.sh` script. run it before installing v2 with `SETUP.sh`

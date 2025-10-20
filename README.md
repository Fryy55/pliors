# PLIoRS (Portable Linux Installer of Reverse Shells)

i made this thing to hack my classmates' asses in compsci classes

requires bash (no way), minimal usage steps:
- edit `vzlom.sh` to use your local ip instead of `10.4.13.13`
- run `prank.sh` from a usb stick/any other way on the target pc with both scripts in the same directory. input a port you want to listen on and gg, it's set up. the script sets up a cronjob and retries the connection to your machine every 10 seconds via bash (you can edit the reverse shell itself ofc)
- to uninstall, simply run `prank.sh` again on that machine

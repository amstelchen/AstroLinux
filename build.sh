#!/bin/sh
sudo rm -rf /tmp/archiso-tmp
sudo mkarchiso -v -w /tmp/archiso-tmp -o ./output releng-astrolinux/
cd output
echo "Adding checksums..."
b2sum "astrolinux-$(date +%Y.%m.01)-x86_64.iso" >> b2sums.txt
md5sum "astrolinux-$(date +%Y.%m.01)-x86_64.iso" >> md5sums.txt
sha1sum "astrolinux-$(date +%Y.%m.01)-x86_64.iso" >> sha1sums.txt
sha256sum "astrolinux-$(date +%Y.%m.01)-x86_64.iso" >> sha256sums.txt
# rm "astrolinux-$(date +%Y.%m.01)-x86_64.iso.asc"
gpg --y --detach-sign -a "astrolinux-$(date +%Y.%m.01)-x86_64.iso"
gpg --y --export --armor --output astrolinux-public-key.asc "Michael John <amstelchen@gmx.at>"

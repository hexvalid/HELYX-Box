#!/bin/bash
#Git committer for HELYXBox by ErkanMDR

#File copy...

cp -avr /home/erkanmdr/kutu /home/erkanmdr/programlar/git/HELYXBox
cp -avr /home/erkanmdr/.i3/* /home/erkanmdr/programlar/git/HELYXBox/i3
cp /home/erkanmdr/.conkyrc  /home/erkanmdr/programlar/git/HELYXBox/conkyrc
cp /home/erkanmdr/.config/dmenu-extended/config/dmenuExtended_preferences.txt  /home/erkanmdr/programlar/git/HELYXBox/config/dmenu-extended/config/

cd /home/erkanmdr/programlar/git/HELYXBox/
git add *
echo "commit message: "
read cm
git commit -m "$cm"
git push origin master

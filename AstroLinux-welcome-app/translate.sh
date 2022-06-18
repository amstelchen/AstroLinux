#!/bin/sh

#intltool-extract --type=gettext/glade welcome.wxg
xgettext -v --from-code=UTF-8 --language=Python --keyword=_ --keyword=N_ \
    --msgid-bugs-address=i18n@astrolinux.org \
    --package-name=astrolinux-welcome-app \
    --default-domain=astrolinux-welcome-app \
    --output-dir=po --output=welcome.pot \
    astrolinux-welcome-app.py

cd po/
sed -i 's/CHARSET/UTF-8/' welcome.pot
#msginit --locale=de_DE --input=welcome.pot --no-translator 
while IFS= read -r line; do
    #msginit --locale=$line --input=welcome.pot --no-translator ;
    echo -n "$line: "
    msgfmt -v $line.po -o $line.mo ;
done < LINGUAS

#msginit --locale=ru --input=show_form.pot
#msginit --locale=en_US --input=show_form.pot
#msginit --locale=de_DE --input=show_form.pot

#msgfmt ru.po -o locale/ru/LC_MESSAGES/show_form.mo
#msgfmt en_US.po -o locale/en_US/LC_MESSAGES/show_form.mo

mkdir -p /raid/archlive/releng/airootfs/usr/share/locale/de/LC_MESSAGES
mkdir -p  /raid/archlive/releng/airootfs/usr/share/locale/en/LC_MESSAGES
#msgfmt de.po -o de.mo
#cp -vr locale/*/ /raid/archlive/releng/airootfs/usr/share/locale/
sudo cp -v de.mo /raid/archlive/releng/airootfs/usr/share/locale/de/LC_MESSAGES/astrolinux-welcome-app.mo
sudo cp -v en.mo /raid/archlive/releng/airootfs/usr/share/locale/en/LC_MESSAGES/astrolinux-welcome-app.mo
sudo cp -v de.mo /usr/share/locale/de/LC_MESSAGES/astrolinux-welcome-app.mo
sudo cp -v en.mo /usr/share/locale/en/LC_MESSAGES/astrolinux-welcome-app.mo
cd ..
cp -v astrolinux-welcome-app.py /raid/archlive/releng/airootfs/usr/share/astrolinux-welcome-app/

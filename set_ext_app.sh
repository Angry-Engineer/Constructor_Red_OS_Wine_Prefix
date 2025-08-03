#!/bin/bash

#путь к профилю
home_path=~
#имя префикса
prefix_name=".wine_PostgreSQL_Client"

cp -f run_from_wine "${home_path}/${prefix_name}/"
chmod 750 "${home_path}/${prefix_name}/run_from_wine"

#обновляем привязки типов файлов для проброса открытия
touch "${home_path}/${prefix_name}/constructor.reg"
cat << EOF > "${home_path}/${prefix_name}/constructor.reg"
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\txtfile]
@="Text Document"

[HKEY_CLASSES_ROOT\txtfile\shell]

[HKEY_CLASSES_ROOT\txtfile\shell\open]

[HKEY_CLASSES_ROOT\txtfile\shell\open\command]
@="${home_path}/${prefix_name}/run_from_wine pluma \\\\\"%1\\\\\""

[HKEY_CLASSES_ROOT\pdffile]
@="PDF Document"

[HKEY_CLASSES_ROOT\pdffile\shell]

[HKEY_CLASSES_ROOT\pdffile\shell\open]

[HKEY_CLASSES_ROOT\pdffile\shell\open\command]
@="${home_path}/${prefix_name}/run_from_wine atril \\\\\"%1\\\\\""

[HKEY_CLASSES_ROOT\jpegfile]
@="JPEG Image"

[HKEY_CLASSES_ROOT\jpegfile\shell]

[HKEY_CLASSES_ROOT\jpegfile\shell\open]

[HKEY_CLASSES_ROOT\jpegfile\shell\open\command]
@="${home_path}/${prefix_name}/run_from_wine eom \\\\\"%1\\\\\""

[HKEY_CLASSES_ROOT\pngfile]
@="PNG Image"

[HKEY_CLASSES_ROOT\pngfile\shell]

[HKEY_CLASSES_ROOT\pngfile\shell\open]

[HKEY_CLASSES_ROOT\pngfile\shell\open\command]
@="${home_path}/${prefix_name}/run_from_wine eom \\\\\"%1\\\\\""

[HKEY_CLASSES_ROOT\rtffile]
@="Rich Text Document"

[HKEY_CLASSES_ROOT\rtffile\shell]

[HKEY_CLASSES_ROOT\rtffile\shell\open]

[HKEY_CLASSES_ROOT\rtffile\shell\open\command]
@="${home_path}/${prefix_name}/run_from_wine libreoffice \\\\\"%1\\\\\""

[HKEY_CLASSES_ROOT\odffile]
@="LibreOffice Document"

[HKEY_CLASSES_ROOT\odffile\shell]

[HKEY_CLASSES_ROOT\odffile\shell\open]

[HKEY_CLASSES_ROOT\odffile\shell\open\command]
@="${home_path}/${prefix_name}/run_from_wine libreoffice \\\\\"%1\\\\\""

[HKEY_CLASSES_ROOT\odgfile]
@="LibreOffice Document"

[HKEY_CLASSES_ROOT\odgfile\shell]

[HKEY_CLASSES_ROOT\odgfile\shell\open]

[HKEY_CLASSES_ROOT\odgfile\shell\open\command]
@="${home_path}/${prefix_name}/run_from_wine libreoffice \\\\\"%1\\\\\""

[HKEY_CLASSES_ROOT\EXCELfile]

[HKEY_CLASSES_ROOT\EXCELfile\Shell]

[HKEY_CLASSES_ROOT\EXCELfile\Shell\Open]

[HKEY_CLASSES_ROOT\EXCELfile\Shell\Open\command]
@="${home_path}/${prefix_name}/run_from_wine libreoffice \\\\\"%1\\\\\""

[HKEY_CLASSES_ROOT\DOCfile]

[HKEY_CLASSES_ROOT\DOCfile\Shell]

[HKEY_CLASSES_ROOT\DOCfile\Shell\Open]

[HKEY_CLASSES_ROOT\DOCfile\Shell\Open\command]
@="${home_path}/${prefix_name}/run_from_wine libreoffice \\\\\"%1\\\\\""

[HKEY_CLASSES_ROOT\VSDfile]

[HKEY_CLASSES_ROOT\VSDfile\Shell]

[HKEY_CLASSES_ROOT\VSDfile\Shell\Open]

[HKEY_CLASSES_ROOT\VSDfile\Shell\Open\command]
@="${home_path}/${prefix_name}/run_from_wine libreoffice \\\\\"%1\\\\\""

[HKEY_CLASSES_ROOT\.xls]
@="EXCELfile"
"Content Type"="application/vnd.ms-excel"

[HKEY_CLASSES_ROOT\.xlsx]
@="EXCELfile"
"Content Type"="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"

[HKEY_CLASSES_ROOT\.doc]
@="DOCfile"
"Content Type"="application/msword"

[HKEY_CLASSES_ROOT\.docx]
@="DOCfile"
"Content Type"="application/vnd.openxmlformats-officedocument.wordprocessingml.document"

[HKEY_CLASSES_ROOT\.vsd]
@="VSDfile"
"Content Type"="application/vnd.visio"

[HKEY_CLASSES_ROOT\.vsdx]
@="VSDfile"
"Content Type"="application/vnd.ms-visio.drawing"

[HKEY_CLASSES_ROOT\.odf]
@="odffile"
"Content Type"="application/libreoffice.text"

[HKEY_CLASSES_ROOT\.odg]
@="odgfile"
"Content Type"="application/libreoffice.drawing"

EOF

env WINEPREFIX="${home_path}/${prefix_name}" wine regedit /C "${home_path}/${prefix_name}/constructor.reg"
rm "${home_path}/${prefix_name}/constructor.reg"


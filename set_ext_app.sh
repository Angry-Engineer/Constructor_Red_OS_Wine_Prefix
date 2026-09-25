#!/bin/bash

#путь к профилю
home_path=~
#имя префикса
prefix_name=".wine_PostgreSQL_Client"

#обновляем привязки типов файлов для проброса открытия
cat << EOF > "${home_path}/constructor.reg"
REGEDIT4

[HKEY_CLASSES_ROOT\pdffile]
@="PDF Document"

[HKEY_CLASSES_ROOT\pdffile\shell]

[HKEY_CLASSES_ROOT\pdffile\shell\open]

[HKEY_CLASSES_ROOT\pdffile\shell\open\command]
@="winebrowser \"%1\""

[HKEY_CLASSES_ROOT\jpegfile]
@="JPEG Image"

[HKEY_CLASSES_ROOT\jpegfile\shell]

[HKEY_CLASSES_ROOT\jpegfile\shell\open]

[HKEY_CLASSES_ROOT\jpegfile\shell\open\command]
@="winebrowser -nohome \"%1\""

[-HKEY_CLASSES_ROOT\jpegfile\shell\open\ddeexec]

[HKEY_CLASSES_ROOT\pngfile]
@="PNG Image"

[HKEY_CLASSES_ROOT\pngfile\shell]

[HKEY_CLASSES_ROOT\pngfile\shell\open]

[HKEY_CLASSES_ROOT\pngfile\shell\open\command]
@="winebrowser -nohome \"%1\""

[-HKEY_CLASSES_ROOT\pngfile\shell\open\ddeexec]

[HKEY_CLASSES_ROOT\rtffile]
@="Rich Text Document"

[HKEY_CLASSES_ROOT\rtffile\shell]

[HKEY_CLASSES_ROOT\rtffile\shell\open]

[HKEY_CLASSES_ROOT\rtffile\shell\open\command]
@="winebrowser \"%1\""

[HKEY_CLASSES_ROOT\odtfile]
@="LibreOffice Document"

[HKEY_CLASSES_ROOT\odtfile\shell]

[HKEY_CLASSES_ROOT\odtfile\shell\open]

[HKEY_CLASSES_ROOT\odtfile\shell\open\command]
@="winebrowser \"%1\""

[HKEY_CLASSES_ROOT\odffile]
@="LibreOffice Document"

[HKEY_CLASSES_ROOT\odffile\shell]

[HKEY_CLASSES_ROOT\odffile\shell\open]

[HKEY_CLASSES_ROOT\odffile\shell\open\command]
@="winebrowser \"%1\""

[HKEY_CLASSES_ROOT\odgfile]
@="LibreOffice Document"

[HKEY_CLASSES_ROOT\odgfile\shell]

[HKEY_CLASSES_ROOT\odgfile\shell\open]

[HKEY_CLASSES_ROOT\odgfile\shell\open\command]
@="winebrowser \"%1\""

[HKEY_CLASSES_ROOT\EXCELfile]

[HKEY_CLASSES_ROOT\EXCELfile\Shell]

[HKEY_CLASSES_ROOT\EXCELfile\Shell\Open]

[HKEY_CLASSES_ROOT\EXCELfile\Shell\Open\command]
@="winebrowser \"%1\""

[HKEY_CLASSES_ROOT\DOCfile]

[HKEY_CLASSES_ROOT\DOCfile\Shell]

[HKEY_CLASSES_ROOT\DOCfile\Shell\Open]

[HKEY_CLASSES_ROOT\DOCfile\Shell\Open\command]
@="winebrowser \"%1\""

[HKEY_CLASSES_ROOT\VSDfile]

[HKEY_CLASSES_ROOT\VSDfile\Shell]

[HKEY_CLASSES_ROOT\VSDfile\Shell\Open]

[HKEY_CLASSES_ROOT\VSDfile\Shell\Open\command]
@="winebrowser \"%1\""

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

[HKEY_CLASSES_ROOT\.odt]
@="odtfile"
"Content Type"="application/vnd.oasis.opendocument.text"

[HKEY_CLASSES_ROOT\.odf]
@="odffile"
"Content Type"="application/vnd.oasis.opendocument.formula"

[HKEY_CLASSES_ROOT\.odg]
@="odgfile"
"Content Type"="application/vnd.oasis.opendocument.graphics"

EOF

env WINEPREFIX="${home_path}/${prefix_name}" wine regedit /C "${home_path}/${prefix_name}/constructor.reg"
rm "${home_path}/${prefix_name}/constructor.reg"


# Nombre del instalador
Name "Instalador CorreoMartinLoza"

# El nombre del instalador
OutFile "ClienteCorreo.exe"

# Configuramos la ruta por defecto donde se instala
InstallDir $DESKTOP\ClienteCorreoMartin

# Pedimos permisos para Windows
RequestExecutionLevel admin

# Pantallas que hay que mostrar del instalador
Page directory
Page instfiles

# Cambiar el idioma
!include "MUI.nsh"
!insertmacro MUI_LANGUAGE "Spanish"

# Seccion principal
Section


# Establecemos la ruta de instalacion al directorio de instalacion
SetOutPath $INSTDIR


File /r "..\out\artifacts\Correo_jar\*"
SetOutPath $INSTDIR\ayuda
File  "..\ayuda\articles.zip"
SetOutPath $INSTDIR\informes
File /r "..\informes\*" 


SetOutPath $INSTDIR\javafx
File /r "C:\Users\Lenovo\Desktop\software\javafx-sdk-13\*"
SetOutPath $INSTDIR\java-runtime
File /r "C:\Users\Lenovo\Desktop\software\jdk-13\bin\java-runtime\*"

SetOutPath $INSTDIR
CreateShortCut \
 `$DESKTOP\CorreoMartinLoza.lnk` \ 
 `$INSTDIR\java-runtime\bin\java.exe` \
 `--module-path "$INSTDIR\javafx\lib" --add-modules javafx.controls,javafx.fxml,javafx.graphics,javafx.web,javafx.base --add-opens=javafx.graphics/javafx.scene=ALL-UNNAMED -jar "$INSTDIR\Correo.jar"` \


# Creamos el desinstalador
writeUninstaller "$INSTDIR\uninstall.exe"

# Creamos un acceso directo apuntando al desinstalador
createShortCut "$DESKTOP\Desinstalar.lnk" "$INSTDIR\uninstall.exe"

# Fin de la seccion

SectionEnd

# Seccion del desintalador
Section "uninstall"

delete "$INSTDIR\uninstall.exe"

RmDir /r "$INSTDIR"


# Borramos el acceso directo del menu de inicio
delete "$DESKTOP\Desinstalar.lnk"
delete "$DESKTOP\CorreoMartinLoza.lnk"

# Fin de la seccion del desinstalador
SectionEnd

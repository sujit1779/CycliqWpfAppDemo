outFile "Cycliq.exe"
!define APPNAME "Cycliq"

name "Cycliq"

  ShowInstDetails show
;-------------------------------
!define VERSION 1.0.0
!define SHORT_APP_NAME "Cycliq"
!define SUPPORT_EMAIL "team@Cycliq.com"


VIProductVersion "1.0.0.0"
VIAddVersionKey ProductVersion "${VERSION}"
VIAddVersionKey "ProductName" "Cycliq"
VIAddVersionKey "Comments" "Cycliq Keep your pictures safe"
VIAddVersionKey "CompanyName" "Better Inc"
VIAddVersionKey "LegalTrademarks" "Cycliq is a trademark of Cycliq Inc"
VIAddVersionKey "LegalCopyright" "© Cycliq Inc"
VIAddVersionKey "FileDescription" "Cycliq"
VIAddVersionKey "FileVersion" "1.0.0"
;--------------------------------
;General
BrandingText " "

  ;Request application privileges for Windows Vista
   RequestExecutionLevel admin

;--------------------------------
;Interface Settings
  !define MUI_ABORTWARNING
;--------------------------------
;InstallDir $PROGRAMFILES\MyApp
;---------for license background color------------------------
;!define MUI_LICENSEPAGE_BGCOLOR fffddd
;-------------------------------------------------------------
;Pages
  ;!define MUI_WELCOMEFINISHPAGE_BITMAP "setup1.bmp"
  !define MUI_WELCOMEFINISHPAGE_BITMAP "setup_logo1.bmp"

;Languages


;Installer Sections

Section
SetOutPath "$INSTDIR"
  ;ADD YOUR OWN FILES HERE...
   WriteRegStr HKCU "Software\Modern UI Test" "" $INSTDIR
  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd




;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...
  Delete "$INSTDIR\Uninstall.exe"
 ; Delete "$INSTDIR\inboxxed_beta.exe"
  RMDir "$INSTDIR"
  DeleteRegKey /ifempty HKCU "Software\Modern UI Test"

SectionEnd




;-----------------------function add--------------------------------------------------------------

/* only change below*/
Section "Cycliq"
;;AddSize 500
SectionIn RO
; File Cycliq.msi
 DetailPrint "Installing Cycliq setup..."
; DetailPrint $OUTDIR
;ExecWait '"msiexec" /i "$OUTDIR\Cycliq.msi"/quiet' $0
ExecWait '"msiexec" /i "$OUTDIR\Cycliq.msi"' $0
Delete $OUTDIR\Cycliq.msi
;DetailPrint "Cycliq setup return value $0"
SectionEnd
;----------------------------------------------------------------------------


section "delay set"
   DetailPrint "Finalizing..."
   Sleep 1000
   DetailPrint "Go to finish page"
sectionend



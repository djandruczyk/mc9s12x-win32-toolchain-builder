[Setup]
AppName=FreeEMS GNU Development Toolchain
AppVerName=FreeEMS Toolchain v.0.1.0 
DefaultDirName={sd}\usr
CreateUninstallRegKey=1
UsePreviousAppDir=1
UsePreviousGroup=1
ChangesEnvironment=true

Compression=lzma
SolidCompression=yes
; Page 0: Initial setup. Disable with DisableStartupPrompt
DisableStartupPrompt=Yes
; Page 3: License Agreement.  Shown if LicenseFile is set.
; Users may proceed to the next page only if the option
; "I accept the agreement" is selected.
LicenseFile=.\LICENSE
; Page 5: Information.  Shown if InfoBeforeFile is set. Name the file
; to make it easy to recognise
;InfoBeforeFile=.\WIN_NOTES.txt

[Tasks]
Name: modifypath; Description: Add application directory to your environmental path, which is required to easily call GCC without needing absolute paths;  Flags:

[Files]
Source: "z:\opt\crossroot2\*.*"; DestDir: "{app}"; Excludes: "*intermediary*"; Flags: recursesubdirs createallsubdirs ignoreversion

[Icons]

[Code]
const
    ModPathName = 'modifypath';
    ModPathType = 'system';

function ModPathDir(): TArrayOfString;
begin
    setArrayLength(Result, 1)
    Result[0] := ExpandConstant('{app}\bin');
end;
#include "modpath.iss"

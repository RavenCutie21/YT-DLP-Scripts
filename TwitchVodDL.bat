@ECHO off
cd "%userprofile%\Videos"
dir /a:d /b
set /P DIR=directory to create:
mkdir "%userprofile%\Videos\%DIR%"
cd "%userprofile%\Videos\%DIR%"
set /P url=insert urls to download: 
yt-dlp -f bestaudio --hls-prefer-native --parse-meta ":(?P<is_live>)" --extract-audio --audio-format wav %url%
CALL "%userprofile%\Videos\DatasetRename.bat"
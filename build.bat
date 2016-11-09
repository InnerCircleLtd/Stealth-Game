SET game=Stealth_Game
dir
rmdir build /s  /Q
mkdir build
jar -cMf build\%game%.love *
copy license.txt build\
xcopy /s c:\Love2D build
cd build
copy %game%.love 32\
TYPE license.txt 32\license.txt >> 32\license2.txt
TYPE  license.txt 64\license.txt >> 64\license2.txt
del 32\license.txt
del 64\license.txt
copy 32\license2.txt 32\license.txt
del 32\license2.txt
del 32\readme.txt
del 32\changes.txt
copy 64\license2.txt 64\license.txt
del 64\license2.txt
del 64\readme.txt
del 64\changes.txt
del license.txt
copy %game%.love 64\
cd 32
rcedit love.exe --set-icon ..\..\icon.ico
copy /b love.exe+%game%.love %game%.exe
del love.ico
del game.ico
del %game%.love
del love.exe
cd ../64
rcedit love.exe --set-icon ..\..\icon.ico
copy /b love.exe+%game%.love %game%.exe
del game.ico
del love.ico
del %game%.love
del love.exe
cd ../
xcopy /s 32 %game%_32\
jar -cMf %game%_Win_32.zip %game%_32
xcopy /s 64 %game%_64\
jar -cMf %game%_Win_64.zip %game%_64
rmdir 32 /s /Q
rmdir 64 /s /Q
rmdir %game%_32 /s /Q
rmdir %game%_64 /s /Q
cd ..
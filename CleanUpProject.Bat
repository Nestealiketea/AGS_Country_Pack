@echo off
set "folder_path=%~dp0"  :: C:\Users\gamen\Desktop\AGS_Country_Pack

:: Перечень папок, которые необходимо удалить (разделяются пробелами)
set "folders_to_delete=Platforms Intermediate DerivedDataCache Binaries Build"

:: Проверяем наличие каждой папки и удаляем ее, если она существует
for %%i in (%folders_to_delete%) do (
    if exist "%folder_path%%%i" (
        echo Удаляется папка: %folder_path%%%i
        rd /s /q "%folder_path%%%i"
    ) else (
        echo Папка не найдена: %folder_path%%%i
    )
)

:: Удаляем все в папке Saved, кроме папки Config
pushd "%folder_path%Saved"
for /d %%d in (*) do (
    if /i not "%%d"=="Config" (
        echo Удаляется папка: %folder_path%Saved\%%d
        rd /s /q "%%d"
    )
)
for %%f in (*) do (
    echo Удаляется файл: %folder_path%Saved\%%f
    del "%%f"
)
popd

echo Указанные папки и файлы удалены (если они существовали).
exit


@echo off
setlocal enabledelayedexpansion

REM Set posts directory
set POST_DIR=_posts

REM Prompt user for inputs
set /p TITLE=Enter post title: 
set /p AUTHOR=Enter author: 
set /p CATEGORIES=Enter categories (comma separated): 
set /p TAGS=Enter tags (comma separated): 

REM Get current date
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (
    set MM=%%a
    set DD=%%b
    set YYYY=%%c
)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set HH=%%a
    set MIN=%%b
)
set DATE=%YYYY%-%MM%-%DD% %HH%:%MIN%:00 +0000

REM Create slug from title
set SLUG=%TITLE%
set SLUG=!SLUG: =-!
set SLUG=!SLUG:.=!
set SLUG=!SLUG:,=!
set SLUG=!SLUG:/=-!

REM Ensure posts directory exists
if not exist %POST_DIR% mkdir %POST_DIR%

REM Filename
set FILENAME=%POST_DIR%\%YYYY%-%MM%-%DD%-%SLUG%.md

REM Create file with front matter
(
echo ---
echo title: "%TITLE%"
echo author: %AUTHOR%
echo date: %DATE%
echo categories: [%CATEGORIES%]
echo tags: [%TAGS%]
echo render_with_liquid: false
echo ---
echo.
echo Write your post here...
) > %FILENAME%

echo New post created at %FILENAME%
pause

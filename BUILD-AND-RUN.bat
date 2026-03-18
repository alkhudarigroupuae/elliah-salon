@echo off
echo Building Elliah Gents Salon...
go build -o expenseowl.exe .\cmd\expenseowl
if errorlevel 1 (
    echo.
    echo ERROR: Build failed. Make sure Go is installed: https://go.dev/dl/
    pause
    exit /b 1
)
echo Build OK. Starting app...
start "" expenseowl.exe
echo App started. Open http://localhost:8080 in your browser.
pause

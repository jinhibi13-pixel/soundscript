@echo off
chcp 65001 >nul
echo ======================================================================
echo 🎵 SoundScript Unicode Decoder 🎵
echo ======================================================================
echo.

REM ファイルがドロップされたかチェック
if "%~1"=="" (
    echo ❌ エラー: .soundscript.txt ファイルをこのバッチファイルにドラッグ＆ドロップしてください
    echo.
    pause
    exit /b
)

REM .soundscript.txt かチェック
echo %~nx1 | findstr /i "\.soundscript\.txt$" >nul
if errorlevel 1 (
    echo ⚠️  警告: このファイルは .soundscript.txt ではありませんが、続行します
    echo.
)

echo 📂 入力ファイル: %~nx1
echo.

REM 出力ファイル名を取得（.soundscript.txtを除去）
set "output=%~dpn1"
REM さらに元の拡張子部分を取得
for %%F in ("%output%") do set "final_output=%%~dpnF_restored%%~xF"

echo 📍 保存先: %final_output%
echo.
echo 🔄 デコード中...
echo.

REM Pythonスクリプトを実行
python "%~dp0soundscript_unicode_fixed.py" decode "%~1" "%final_output%"

echo.
echo ======================================================================
if errorlevel 1 (
    echo ❌ エラーが発生しました
) else (
    echo ✅ デコード完了！
    echo 💾 保存先: %final_output%
    echo 🎵 ファイルを確認してください
)
echo ======================================================================
echo.
pause

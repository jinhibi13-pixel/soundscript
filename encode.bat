@echo off
chcp 65001 >nul
echo ======================================================================
echo 🎵 SoundScript Unicode Encoder 🎵
echo ======================================================================
echo.

REM ファイルがドロップされたかチェック
if "%~1"=="" (
    echo ❌ エラー: ファイルをこのバッチファイルにドラッグ＆ドロップしてください
    echo.
    pause
    exit /b
)

echo 📂 入力ファイル: %~nx1
echo 📍 保存先: %~dp1%~nx1.soundscript.txt
echo.
echo 🔄 エンコード中...
echo.

REM Pythonスクリプトを実行（バッチファイルと同じフォルダにあると仮定）
python "%~dp0soundscript_unicode_fixed.py" encode "%~1"

echo.
echo ======================================================================
if errorlevel 1 (
    echo ❌ エラーが発生しました
) else (
    echo ✅ エンコード完了！
    echo 💾 保存先: %~dp1%~nx1.soundscript.txt
)
echo ======================================================================
echo.
pause

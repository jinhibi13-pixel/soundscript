# soundscript
注意：これは初心者によるプロジェクトです。バグが発生する可能性は大いにあるため、ご了承の上ご利用ください。
SoundScript Unicode は、任意のファイルを Unicode 文字列へ変換する実験的エンコードツールです。
Unicode Private Use Area（U+E000–U+F8FF）を利用し、1文字あたり12bitでバイナリデータを保持します。
生成される出力はUTF-8テキストとして保存できます。
本プロジェクトはロマン目的の実験実装です。
動作環境
Python 3.8以上
Windows（.bat使用）
※Pythonがインストールされていない場合は https://www.python.org/ から取得してください。
セットアップ
以下のファイルを同じフォルダに配置してください。

soundscript_unicode.py
encode.bat
decode.bat

使い方
エンコード（ファイル → Unicode文字列）
変換したいファイルを encode.bat にドラッグ＆ドロップ
同じフォルダに .soundscript.txt が生成されます
例：
song.mp3
→ song.mp3.soundscript.txt
デコード（Unicode文字列 → 元ファイル）
.soundscript.txt を decode.bat にドラッグ＆ドロップ
元ファイルが _restored 付きで復元されます
例：
song.mp3.soundscript.txt
→ song_restored.mp3
技術仕様
使用文字範囲：U+E000–U+F8FF（6400文字）
実効ビット数：12bit/文字
サイズヘッダ：48bit
軽量パターン圧縮（0x00 / 0xFF / 2byte繰り返し検出）
理論比率：
8bit / 12bit ≒ 0.67
ランダムデータでは圧縮されません。
注意事項
文字列が破損すると復元できません（エラー訂正未実装）
UTF-8以外で保存すると破損する可能性があります
Unicode自動変換を行う環境では注意してください

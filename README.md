# hulftsendバッチ
## 概要
hulftのutlsendコマンドでファイル送信を行うバッチです。
事前に相手先のHULFTサービスが起動しているかの生存チェックも行います。

## パラメーターの設定
バッチ内でSETしているパラメータを書き換えて使用してください。
- HULFTPATH:utlsend.exeとutlalivecheck.exeが存在するフォルダ
- FILEID:HULFTで設定しているファイルID
- HOSTNAME:相手先ホスト名
- PORTNO:相手先HULFTポート番号

@echo off
rem ----------------------------
rem HULFT送信処理
rem 相手先のHULFT起動確認後にファイル送信
rem 正常終了(0)
rem 相手先HULFT生存確認エラー(8)
rem 異常終了(9)
rem 
rem ----------------------------


rem パラメーター(ホスト名/ファイルID/ポート番号を指定)
SET HULFTPATH="x:\HULFT Family\hulftx\bin"
SET FILEID=xxxxx
SET HOSTNAME=xxxxx
SET PORTNO=xxxxx
SET CHECK_TIMEOUT_SEC=20
SET SEND_TIMEOUT_SEC=300

rem ----------------------------

rem 相手先HULFT生存確認

%HULFTPATH%\utlalivecheck -h %HOSTNAME% -p %PORTNO% -w %CHECK_TIMEOUT_SEC%
if NOT %ERRORLEVEL%==0 (
    goto ERROR
)
rem HULFT送信
rem -syncオプション(同期転送)　転送結果が返ってくるまで待つ

%HULFTPATH%\utlsend -f %FILEID% -sync -w %SEND_TIMEOUT_SEC%

if %ERRORLEVEL% == 0 (
echo %DATE:/=-% %TIME: =0% %~n0 正常終了
exit /B 0
) else (
echo %DATE:/=-% %TIME: =0% %~n0 HULFTエラーコード：%ERRORLEVEL%で異常終了しました。
exit /B 9
)

:ERROR
echo %DATE:/=-% %TIME: =0% %~n0 相手先HULFT生存確認でエラーになりました。
exit /B 8
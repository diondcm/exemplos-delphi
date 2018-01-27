@echo off
IF EXIST autoCommit.exe (
  echo na pasta
 ) ELSE (
	git pull
 )
@echo on
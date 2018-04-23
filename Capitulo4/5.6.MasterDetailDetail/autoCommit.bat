@echo off
IF EXIST autoCommit.exe (
  autoCommit.exe 
 ) ELSE (
	echo autoCommit nao localizado
 )
@echo on
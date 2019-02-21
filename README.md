# powershell-docker-toolkit
Some powershell shortcuts, backed by docker images doing the work  
(docker desktop &amp; windows professional are required)

Prerequisites:
- Windows (10?) Pro
- Docker desktop (needs Windows Pro)
- These files in a subfolder named "WindowsPowerShell" in your documents folder.

The first time you start powershell the scripts should be loaded automatically.  
If, and this will probbably happen, you get the following error "... running scripts is disabled ..."  
Just run a new powershell window as ADMINISTRATOR! an type the following command:  
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

The first time you run a command, some required folders will be created automatically in your home folder.  
By editing the variable PS_DCR_TK_HOME you can relocate this location.

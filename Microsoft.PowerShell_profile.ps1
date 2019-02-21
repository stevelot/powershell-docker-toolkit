
#echo "Bij error '... running scripts is disabled ...' --> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned #-Scope CurrentUser"
echo "Inladen aliasen (git, node+npm)"
$Global:PS_DCR_TK_HOME=("${HOME}\ps-docker-toolkit").Replace('\', '/')

mkdir ${PS_DCR_TK_HOME} -EA SilentlyContinue > $null #Aanmaken folder indien deze nog niet bestaat +ALLE msg stil houden

C:\Users\stees\Documents\WindowsPowerShell\git.ps1
C:\Users\stees\Documents\WindowsPowerShell\node+npm.ps1

#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned #-Scope CurrentUser

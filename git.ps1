
#https://hub.docker.com/r/alpine/git/

#Aanmaken folder indien deze nog niet bestaat +ALLE msg stil houden
mkdir ${PS_DCR_TK_HOME}/git/root -EA SilentlyContinue > $null 

#echo "Inladen git alias: Docker-AlpineGit. Verwijder via: Remove-Item alias:\git"
Remove-Item alias:\git -EA SilentlyContinue #Verwijderen indien al bestaat +error msg stil houden

Function global:Use-Docker-AlpineGit {
  #echo "alpineGit: $@: ${args}, pwd: $(Get-Location), home: ${HOME}"
  docker run -ti --rm `
            -v "${PS_DCR_TK_HOME}/git/root:/root" `
            -v "$(Get-Location):/_/$((Get-Item .).Name)" `
            -w "/_/$((Get-Item .).Name)" `
            alpine/git ${args}
          }
          
          #docker run -ti --rm -v "${HOME}/.ssh:/root/.ssh" -v "$(pwd):/git" alpine/git "${args}"
          #-v "$(Get-Location):/_docker" `

#Set-Alias git Docker-AlpineGit #-Option AllScope 
New-Alias -Name "git" -Value Use-Docker-AlpineGit -Scope Global -Description "Git, maar dan via docker (alpine/git)"

#voorbeeld: git version

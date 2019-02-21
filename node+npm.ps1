
#https://hub.docker.com/r/alpine/git/

#$Global:DOCKER_HOME=("${HOME}\docker-ps\node").Replace('\', '/')

#Aanmaken folder indien deze nog niet bestaat +ALLE msg stil houden
mkdir ${PS_DCR_TK_HOME}/node+npm/node_modules -EA SilentlyContinue > $null 

#mkdir ${DOCKER_HOME}\node_modules -EA SilentlyContinue > $null #Aanmaken folder indien deze nog niet bestaat +ALLE msg stil houden
#echo "Inladen git alias: Docker-AlpineGit. Verwijder via: Remove-Item alias:\git"
Remove-Item alias:\node -EA SilentlyContinue #Verwijderen indien al bestaat +error msg stil houden
Remove-Item alias:\npm  -EA SilentlyContinue #Verwijderen indien al bestaat +error msg stil houden

#https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md

Function global:Use-Ps-Docker-Node {
  #echo "alpineGit: $@: ${args}, pwd: $(Get-Location), home: ${HOME}"
  docker run -ti --rm -w /_docker `
            -v "/usr/local/lib/node_modules/npm" `
            -v "${PS_DCR_TK_HOME}/node+npm/node_modules:/usr/local/lib/node_modules" `
            -v "$(Get-Location):/_/$((Get-Item .).Name)" `
            -w "/_/$((Get-Item .).Name)" `
            node node ${args}
             #            -e "NODE_ENV=production" `
             #            -u "node" `
             #            -m "300M" --memory-swap "1G" `
 #            -e PATH=$PATH:/home/node/.npm-global/bin ` # optionally if you want to run npm global bin without specifying path
  #docker run -ti --rm -v "${HOME}/.ssh:/root/.ssh" -v "$(pwd):/git" alpine/git "${args}"
}
Function global:Use-Ps-Docker-Npm {
  #echo "alpineGit: $@: ${args}, pwd: $(Get-Location), home: $DOCKER_HOME"
  docker run -ti --rm `
            -v "/usr/local/lib/node_modules/npm" `
            -v "${PS_DCR_TK_HOME}/node+npm/node_modules:/usr/local/lib/node_modules" `
            -v "$(Get-Location):/_/$((Get-Item .).Name)" `
            -w "/_/$((Get-Item .).Name)" `
            node npm ${args}
            # optionally if you want to run npm global bin without specifying path
            # -e "NPM_CONFIG_PREFIX=/home/node/.npm-global" `
            # -e "PATH=\`$PATH:/home/node/.npm-global/bin" ` 
  #docker run -ti --rm -v "${HOME}/.ssh:/root/.ssh" -v "$(pwd):/git" alpine/git "${args}"
}


#Set-Alias git Docker-AlpineGit #-Option AllScope 
New-Alias -Name "node" -Value Use-Ps-Docker-Node -Scope Global -Description "Node, maar dan via docker (node node)"
New-Alias -Name "npm"  -Value Use-Ps-Docker-Npm  -Scope Global -Description "Npm, maar dan via docker (node npm)"

#voorbeeld: node version

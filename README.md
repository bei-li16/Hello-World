# Hello-World
## Create github projection
1.echo "# Hello-World" >> README.md         ; Create README.md file.
2.git init                                  ; init the project.
3.git add README.md                         ; add file README.md.
4.git commit -m "first commit"              ; commit changes to local repository
5.git branch -M master                      ; rename the branch master to <new-branchname>
6.git remote add origin https://github.com/bei-li16/Hello-World.git     ; connect to URL https://github.com/bei-li16/Hello-World.git
7.git push -u origin master                 ; push to origin, -u is short of --set-upstream 它设置了上游分支，使得本地分支与远程分支保持同步

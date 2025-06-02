# Create github projection

- echo "# Hello-World" >> README.md         ; Create README.md file.
- git init                                  ; init the project.
- git add README.md                         ; add file README.md.
- git commit -m "first commit"              ; commit changes to local repository
- git branch -M master                      ; rename the branch master to [new-branchname]
- git remote add origin <https://github.com/bei-li16/Hello-World.git>     ; connect to URL <https://github.com/bei-li16/Hello-World.git>
- git push -u origin master                 ; push to origin, -u is short of --set-upstream 它设置了上游分支，使得本地分支与远程分支保持同步

# git command list

1. git init —— 初始化工程
2. git add README.md —— 暂存文件README.md, 或使用通配符.
3. git commit -m "first commit" —— 添加提交备注或使用[git commit OR git commit --amend]
4. git branch -M master —— 重命名当前分支为master
5. git remote add origin <https://github.com/bei-li16/Hello-World.git> —— 与远程分支建立连接
6. git push -u origin master —— push to origin, -u is short of --set-upstream 它设置了上游分支，使得本地分支与远程分支保持同步
7. git push origin master —— 推送到远程分支master
8. git config --global user.name "当前仓库的用户名"
9. git config --global user.email "当前仓库的邮箱@example.com"
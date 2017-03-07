# Github Repository

```
mkdir GanMY

cd GanMY

echo "# GanMY" > README.md

mkdir docker

cd docker

touch "Start.md"

vim Start.md

cd ..

git init

git add .\README.md

git add .\docker\Start.md

git commit -m "first commit"

git remote add origin git@github.com:pywx4/GanMY.git

git push -u origin master
```

```
touch [newfile] #创建文件
#编辑文件
git add [path_to_newfile] #添加到仓库
git commit -m "the commit info" # 设置提交信息
git push -u origin master # 提交
```

Git使用方法
git init here      // 创建本地仓库(repository)，将会在文件夹下创建一个 .git 文件夹，.git 文件夹里存储了所有的版本信息、标记等内容
git remote add origin git@github.com:winter1991/helloworld.git        //把本地仓库和远程仓库关联起来。如果不执行这个命令的话，每次 push 的时候都需要指定远程服务器的地址
git add        // 从本地仓库增删，结果将会保存到本机的缓存里面
git commit -m "注释"     //提交，把本机缓存中的内容提交到本机的 HEAD 里面
git push origin master   //把本地的 commit push 到远程服务器上， origin 也就是之前 git remote add origin 那个命令里面的 origin，origin 替代了服务器仓库地址：git push git@github.com:winter1991/helloworld.git master
git pull origin master  //从远程服务器 pull 新的改动
git status             //查看状态
git add -A            //提交全部修改
git config --global user.name "xxx"     //配置用户名，上传本地 repository 到服务器上的时候，在 Github 上会显示这里配置的上传者信息
git config --global user.email "xxx"     //配置邮箱
git config --list                                     //查看配置列表
git rm xxx                                                //从本地仓库中删除指定文件
git rm -r xxx                                              //从本地仓库中删除指定文件夹
git commit -m "注释"                             //把本机缓存中的内容提交到本机的 HEAD 里面
git push origin master                          //把本地的 commit push 到远程仓库中
使用 .gitignore 文件忽略指定的内容：

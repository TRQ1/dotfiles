# 내용 없이 git commit 
git commit --allow-empty

# 커밋간의 다른 부분 확인
git diff <branchA> <branchB>

# commit 내역 돌리기
git reset --soft HEAD <commit>

# commit log 조회
git log -p <number>

# commit 리스트 확인 from https://stackoverflow.com/questions/1838873/visualizing-branch-topology-in-git
git log log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'

# 해당 파일 commit 리스트 확인
git log --follow <file>

# commit 정보 확인
git show 


# git repository migration
git clone --mirror <As-is Repository> <Diretory>
git push <To-be Repository> --all

# git 원격 리포지토리에서 PR 정보 가져오기
git pull upstream refs/pull/<PR NUMBER>/head:<Branch Name>

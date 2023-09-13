#=begin
p 'This is a test'
#=end
#=begin
Michaels-MacBook-Pro:Launch_School balloon$ echo "# LS_R101_Lesson_2" >> README.md
Michaels-MacBook-Pro:Launch_School balloon$ git init
Initialized empty Git repository in /Users/balloon/Launch_School/.git/
Michaels-MacBook-Pro:Launch_School balloon$ git add README.md
Michaels-MacBook-Pro:Launch_School balloon$ git commit -m "first commit"
[main (root-commit) cc157fc] first commit
 1 file changed, 1 insertion(+)
 create mode 100644 README.md
Michaels-MacBook-Pro:Launch_School balloon$ git branch -M main
Michaels-MacBook-Pro:Launch_School balloon$ git remote add origin https://github.com/MMcKoveck/LS_R101_Lesson_2.git
Michaels-MacBook-Pro:Launch_School balloon$ git push -u origin main
#=end
# THIS IS A n eighth ATTEMPT
=begin
get ready for a lesson of parenthesis.
Still dragging and dropping.
=end
Git: fatal: a branch named 'main' already exists
1 parent 09b6254 commit ac0a235

Can't' push refs to remote. Try running "Pull" first to integrate your changes.
can't' publish branch

# THIS IS EVERYTHING I DID IN THE TERMINAL # BUT I DID MORE STUFF IN THE VSCODE TERMINAL
Michaels-MacBook-Pro:LS_R101_Small_Problems balloon$ cd ..
Michaels-MacBook-Pro:Launch_School balloon$ touch lesson_2
Michaels-MacBook-Pro:Launch_School balloon$ ls
LS_R101_Small_Problems  LS_Ruby			LS_Ruby 2(backup)	lesson_2
Michaels-MacBook-Pro:Launch_School balloon$ rm lesson_2
Michaels-MacBook-Pro:Launch_School balloon$ ls
LS_R101_Small_Problems  LS_Ruby			LS_Ruby 2(backup)
Michaels-MacBook-Pro:Launch_School balloon$ touch LS_R101_Lesson_2
Michaels-MacBook-Pro:Launch_School balloon$ ls
LS_R101_Lesson_2        LS_R101_Small_Problems	LS_Ruby			LS_Ruby 2(backup)
Michaels-MacBook-Pro:Launch_School balloon$ echo "# LS_R101_Lesson_2" >> README.md
Michaels-MacBook-Pro:Launch_School balloon$ git init
Initialized empty Git repository in /Users/balloon/Launch_School/.git/
Michaels-MacBook-Pro:Launch_School balloon$ git add README.md
Michaels-MacBook-Pro:Launch_School balloon$ git commit -m "first commit"
[main (root-commit) cc157fc] first commit
 1 file changed, 1 insertion(+)
 create mode 100644 README.md
Michaels-MacBook-Pro:Launch_School balloon$ git branch -M main
Michaels-MacBook-Pro:Launch_School balloon$ git remote add origin https://github.com/MMcKoveck/LS_R101_Lesson_2.git
Michaels-MacBook-Pro:Launch_School balloon$ git push -u origin main
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Writing objects: 100% (3/3), 235 bytes | 235.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/MMcKoveck/LS_R101_Lesson_2.git
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.
Michaels-MacBook-Pro:Launch_School balloon$ gh repo clone MMcKoveck/LS_R101_Lesson_2
To get started with GitHub CLI, please run:  gh auth login
Alternatively, populate the GH_TOKEN environment variable with a GitHub API authentication token.
Michaels-MacBook-Pro:Launch_School balloon$ git push -u origin main
branch 'main' set up to track 'origin/main'.
Everything up-to-date
Michaels-MacBook-Pro:Launch_School balloon$ 
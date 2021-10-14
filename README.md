# POC GitHub CI/CD
This is a .NET 5.0 webapi template project. Experimenting with GitHub CI/CD.

## Steps to create and push the project to GitHub
1. *In GitHub*, create new (private) repo called WebApiTemplate by clicking the New button
1. *On your machine* using Visual Studio, create new ASP.NET Core Web Application project (.NET Core, ASP.NET Core 5.0, ASP.NET Core Web API, Configure for HTTPS, Solution file in the same folder). Run following commands in the project folder:

	```bash
	git init
	dotnet new gitignore
	git add .
	git commit -m "first commit"

    # add origin pointer on your machine for this repo
	git remote add origin https://github.com/savcha1/WebApiTemplate.git 

    # verify the fetch and push urls for this repo, which is origin
	git remote -v	

    # push current branch (master) to origin and create the master branch in remote
	git push - u origin master	

	```
1. *In GitHub* to see project files in the repo in the master branch

## To Do
- [x] Create webapi template project
- [x] Push to GitHub
- [ ] Create CI pipeline
- [ ] Push to AWS ECR
- [ ] CD to AWS Fargate

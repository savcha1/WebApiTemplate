# POC GitHub CI/CD
This is a .NET 5.0 webapi template project. Experimenting with GitHub CI/CD.

### Create and push new project to GitHub
1. *In GitHub*, create new (private) repo called WebApiTemplate by clicking the New button
1. *On your machine* using Visual Studio, create new ASP.NET Core Web Application project (.NET Core, ASP.NET Core 5.0, ASP.NET Core Web API, Configure for HTTPS, Solution file in the same folder). Run following commands in the project folder:

	```bash
	# initialize git
	git init

	# add gitignore file (this autopopulates with standard ignore files)
	dotnet new gitignore

	# commit changes
	git add .
	git commit -m "first commit"

    # add origin pointer on your machine for this repo
	git remote add origin https://github.com/savcha1/WebApiTemplate.git 

    # verify the fetch and push urls for this repo, which is origin
	git remote -v	

    # push current branch (master) to origin and create the master branch in remote
	git push - u origin master	

	```
	> The project is swagger enabled and runs on https://localhost:5001/WeatherForecast

1. *In GitHub* to see project files in the repo in the master branch

### Create initial CI pipeline
*In GitHub,* go to Actions tab and pick the ".NET Build and test a .NET or ASP.NET Core project" workflow template. No changes are needed to this file. 
Commit this file. On commiting the file (and going forward any push to master branch) will run the CI pipeline (build and test)

### Dockerize
Create a Dockerfile, a docker-compose.yml and a .dockerignore file. To run the container, run following in the project foler
```
docker-compose up
```
> In the container port 80 is exposed which is mapped to 8096 on the host; the api is accessible on https://localhost:8096/WeatherForecast


### Push to AWS ECR
Use GitHub Actions to push image to AWS ECR (under assumed role to Denali AWS account)
## To Do
- [x] Create webapi template project
- [x] Push to GitHub
- [x] Create basic CI pipeline
- [x] Dockerize
- [x] Change CI to Push to AWS ECR
- [ ] CD to AWS Fargate
- [ ] Use Terraform for IaC

# get sdk image to build project & cd to app folder
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-layer
WORKDIR /app

# copy csproj from local to /app, get project dependencies and tools
COPY *.csproj ./
RUN dotnet restore

# copy everything from local to /app, build project with output in out folder
COPY . ./
RUN dotnet publish -c Release -o out

# get .net runtime, cd to app folder, copy contents of out folder from build-layer to app folder of runtime-image
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime-image
WORKDIR /app
COPY --from=build-layer /app/out ./

# run the project when container starts
ENTRYPOINT ["dotnet", "WebApiTemplate.dll"]
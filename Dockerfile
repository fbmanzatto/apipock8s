#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY ["ApiPocK8s/ApiPocK8s.csproj", "ApiPocK8s/"]
RUN dotnet restore "ApiPocK8s/ApiPocK8s.csproj"
COPY . .
WORKDIR "/src/ApiPocK8s"
RUN dotnet build "ApiPocK8s.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ApiPocK8s.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ApiPocK8s.dll"]
FROM mcr.microsoft.com/dotnet/sdk:7.0
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs
COPY . /opt/app
WORKDIR /opt/app
RUN dotnet build

WORKDIR /opt/app/DotnetTemplate.Web
RUN npm install && npm run build
ENV WEBAPP_PORT=5000
EXPOSE ${WEBAPP_PORT}
ENTRYPOINT ["dotnet", "run"]
# Usa uma imagem base oficial do Node.js
FROM node:20

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia os arquivos de configuração do projeto
COPY package*.json ./

# Instala as dependências do projeto
RUN npm install --omit=dev

# Copia todos os arquivos do projeto para o contêiner
COPY . .

# Compila o TypeScript para JavaScript
RUN npm run build:server

# Expõe a porta que o servidor irá rodar
EXPOSE 3001

# Define o comando para iniciar a aplicação
CMD ["node", "./dist-server/server.js"]
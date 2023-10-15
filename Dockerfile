FROM node:16

WORKDIR /app

COPY package.json ./

# Install Truffle globally
RUN npm install -g truffle

# Install Truffle tools
RUN npm install @truffle/hdwallet-provider truffle-plugin-verify truffle-assertions
RUN npm install @openzeppelin/contracts
RUN npm install chai dotenv

# Install dependencies
ARG CACHE_INVALIDATE=1
RUN npm install

# After installing the dependencies, copy the rest of your application to the image
COPY . .

CMD ["truffle", "test"]
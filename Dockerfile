#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
#install all packages in package.json
#expose port 8080 and run the app
#the docker lecture will help you complete this file 
#there should be a total of 9 lines

From node:10-alpine

RUN mkdir -p /home/ojdk/app/ && chown -R node:node /home/ojdk/app

WORKDIR /home/node/app

COPY *.java ./
COPY junit-* ./

USER node

RUN javac -cp "junit-4.10.jar:." *.java

COPY --chown=ojdk:ojdk . .

CMD ["java", "-cp", "junit-4.10.jar:.", "org.junit.runner.JUnnitCore"]
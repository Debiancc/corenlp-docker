FROM java:jre-alpine

RUN apk add --update --no-cache \
	 unzip \
	 wget

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2017-06-09.zip

RUN unzip stanford-corenlp-full-2017-06-09.zip && \
	rm stanford-corenlp-full-2017-06-09.zip

WORKDIR stanford-corenlp-full-2017-06-09

RUN wget http://nlp.stanford.edu/software/stanford-chinese-corenlp-2017-06-09-models.jar

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV PORT 9000

EXPOSE $PORT

CMD java -cp "*" -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer --serverProperties StanfordCoreNLP-chinese.properties -port 9000

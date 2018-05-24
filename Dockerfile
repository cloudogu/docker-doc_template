# 0.7.0 seems to break c
FROM cloudogu/pandoc:0.6.0

LABEL name="cloudogu/doc_template" \
      maintainer="thomas.grosser@cloudogu.com"

RUN mkdir -p /usr/local/pandoc

COPY template /usr/local/pandoc/template/
COPY scripts /usr/local/bin/


WORKDIR /data

ENTRYPOINT ["convert.sh"]


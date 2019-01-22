FROM candygene/docker-virtuoso

RUN apt update
RUN apt-get install wget

WORKDIR /root

RUN wget https://raw.githubusercontent.com/candYgene/pbg-ld/master/src/install_pkgs.sql
RUN wget https://raw.githubusercontent.com/candYgene/pbg-ld/master/src/get_rdf.sh
RUN wget https://raw.githubusercontent.com/candYgene/pbg-ld/master/data/sgn-ld.tar.gz
RUN wget https://raw.githubusercontent.com/candYgene/pbg-ld/master/src/import_rdf.sql
RUN wget https://raw.githubusercontent.com/candYgene/pbg-ld/master/src/update_rdf.sql
RUN wget https://raw.githubusercontent.com/candYgene/pbg-ld/master/src/post_install.sql

RUN chmod +x get_rdf.sh
RUN ./get_rdf.sh /root/data/

RUN mkdir download && tar xzvf sgn-ld.tar.gz -C download/
RUN mv ./download/rdf/* /root/data

COPY run.sh /root
CMD ./run.sh

FROM candygene/docker-virtuoso

RUN git clone -b upstream https://github.com/c-martinez/pbg-ld.git /root/pbg-ld

WORKDIR /root/

RUN cp ./pbg-ld/src/get_rdf.sh /root/get_rdf.sh
RUN cp ./pbg-ld/src/install_pkgs.sql /root/install_pkgs.sql
RUN cp ./pbg-ld/src/import_rdf.sql   /root/import_rdf.sql
RUN cp ./pbg-ld/src/update_rdf.sql   /root/update_rdf.sql
RUN cp ./pbg-ld/src/post_install.sql /root/post_install.sql
RUN cp ./pbg-ld/DockerScripts/processData.sh /root/processData.sh
RUN cp ./pbg-ld/DockerScripts/loadData.sh /root/loadData.sh

RUN ./get_rdf.sh /root/data
RUN ./processData.sh
RUN ./loadData.sh

CMD virtuoso-t +wait +foreground +configfile ${VOS_CONFIG}

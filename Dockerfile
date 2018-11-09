FROM ubuntu
COPY entry.sh /
ENTRYPOINT ["./entry.sh"]

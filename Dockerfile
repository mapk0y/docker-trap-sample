FROM debian

COPY /entrypoint.sh /
CMD ["/entrypoint.sh"]

FROM   centos:7
COPY   dispatch /
RUN    chmod +x dispatch
CMD    /dispatch
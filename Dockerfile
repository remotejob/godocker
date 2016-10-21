FROM scratch
EXPOSE 8080

COPY godocker /
COPY assets/ /assets/
ENTRYPOINT ["/godocker"]

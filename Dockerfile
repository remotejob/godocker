FROM scratch
EXPOSE 80

COPY godocker /
COPY assets/ /assets/
ENTRYPOINT ["/godocker"]

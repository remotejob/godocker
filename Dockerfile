FROM scratch
EXPOSE 8080
COPY godocker /
ENTRYPOINT ["/godocker"]

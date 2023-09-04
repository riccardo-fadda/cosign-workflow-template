FROM alpine:latest

RUN echo "This time we use the PAT token only in the merge action"

CMD ["/bin/sh"]
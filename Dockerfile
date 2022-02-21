#FROM alpine/helm
FROM dtzar/helm-kubectl
RUN apk add --no-cache gomplate
ENTRYPOINT []
CMD ["sh"]

#FROM alpine/helm
FROM dtzar/helm-kubectl
RUN apk add --no-cache gomplate && \
    helm plugin install https://github.com/chartmuseum/helm-push
ENTRYPOINT []
CMD ["sh"]

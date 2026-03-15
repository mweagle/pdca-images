FROM golang:1.24-alpine

COPY run_coverage.sh /usr/local/bin/run_coverage
RUN chmod +x /usr/local/bin/run_coverage

ENTRYPOINT ["run_coverage"]

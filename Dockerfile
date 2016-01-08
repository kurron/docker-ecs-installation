FROM python:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get --quiet update && \
    apt-get --quiet --yes install groff less && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip python-dateutil awscli

# Set the AWS environment variables
ENV AWS_ACCESS_KEY_ID OVERRIDE ME 
ENV AWS_SECRET_ACCESS_KEY OVERRIDE_ME
ENV AWS_REGION OVERRIDE_ME 

ENTRYPOINT ["/usr/local/bin/aws"]
CMD ["--version"]

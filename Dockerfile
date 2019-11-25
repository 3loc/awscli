FROM python:slim
RUN pip install awscli
RUN aws configure set default.s3.signature_version s3v4
CMD aws

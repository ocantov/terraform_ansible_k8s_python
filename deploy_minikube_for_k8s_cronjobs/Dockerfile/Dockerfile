FROM postgres:12-alpine

RUN apk --update add python3

RUN pip3 install \
    boto3==1.9.248 \
    botocore==1.12.248 \
    docutils==0.15.2 \
    jmespath==0.9.4 \
    pyaml==19.4.1 \
    python-dateutil==2.8.0 \
    PyYAML==5.1.2 \
    s3transfer==0.2.1 \
    six==1.12.0 \
    urllib3==1.25.6

WORKDIR /app
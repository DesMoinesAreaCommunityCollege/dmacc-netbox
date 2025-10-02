FROM docker.io/netboxcommunity/netbox:v4.4.2-3.4.1

COPY ./nginx-unit.json /etc/unit/nginx-unit.json
COPY ./plugins.py /etc/netbox/config/plugins.py

RUN apt-get update
RUN apt-get install -y git
RUN /usr/local/bin/uv pip install \
    git+https://github.com/netboxlabs/netbox-custom-objects.git@0db00de7939ead817e58cf553390855564a6a5de \
    netbox-plugin-dns==1.4.1 \
    netbox-documents==0.7.4
    # git+https://github.com/jasonyates/netbox-documents.git@refs/pull/75/head
    # netbox-reorder-rack==1.1.3
    # netbox-topology-views==3.9.1
    # netbox-plugin-webhook-receiver==0.2.0 \
    # netbox-plugin-prometheus-sd==0.7.0

RUN SECRET_KEY="dummydummydummydummydummydummydummydummydummydummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input

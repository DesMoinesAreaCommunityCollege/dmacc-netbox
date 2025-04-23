FROM docker.io/netboxcommunity/netbox:v4.2.8-3.2.0

COPY ./nginx-unit.json /etc/unit/nginx-unit.json
COPY ./plugins.py /etc/netbox/config/plugins.py

RUN /usr/local/bin/uv pip install \
    netbox-plugin-dns==1.2.9 \
    netbox-documents==0.7.2
    # netbox-reorder-rack==1.1.3
    # netbox-topology-views==3.9.1
    # netbox-plugin-webhook-receiver==0.2.0 \
    # netbox-plugin-prometheus-sd==0.7.0

RUN SECRET_KEY="dummydummydummydummydummydummydummydummydummydummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input

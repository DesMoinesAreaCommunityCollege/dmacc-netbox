FROM docker.io/netboxcommunity/netbox:v4.1.8-3.0.2

COPY ./nginx-unit.json /etc/unit/nginx-unit.json
COPY ./plugins.py /etc/netbox/config/plugins.py

RUN /opt/netbox/venv/bin/pip install --no-cache-dir --no-warn-script-location \
    netbox-plugin-dns==1.1.6 \
    netbox-documents==0.7.0 \
    netbox-reorder-rack==1.1.3
    # netbox-topology-views==3.9.1
    # netbox-plugin-webhook-receiver==0.2.0 \
    # netbox-plugin-prometheus-sd==0.7.0

RUN SECRET_KEY="dummydummydummydummydummydummydummydummydummydummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input

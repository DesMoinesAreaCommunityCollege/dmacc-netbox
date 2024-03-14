FROM docker.io/netboxcommunity/netbox:v3.7.4-2.8.0

COPY ./nginx-unit.json /etc/unit/nginx-unit.json
COPY ./plugins.py /etc/netbox/config/plugins.py

RUN /opt/netbox/venv/bin/pip install --no-cache-dir --no-warn-script-location \
    netbox-plugin-dns==0.22.4 \
    netbox-documents==0.6.3 \
    netbox-plugin-webhook-receiver==0.2.0 \
    netbox-plugin-prometheus-sd==0.7.0

RUN SECRET_KEY="dummydummydummydummydummydummydummydummydummydummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input

FROM docker.io/netboxcommunity/netbox:v3.6.4-2.7.0

# RUN apt-get update && apt-get -y install git

# COPY ./plugin_requirements.txt /
COPY ./plugins.py /etc/netbox/config/plugins.py

RUN /opt/netbox/venv/bin/pip install --no-cache-dir --no-warn-script-location \
    netbox-plugin-dns==0.20.2 \
    netbox-documents==0.6.0

RUN SECRET_KEY="dummydummydummydummydummydummydummydummydummydummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input

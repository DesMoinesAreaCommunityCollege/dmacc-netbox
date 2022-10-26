FROM docker.io/netboxcommunity/netbox:v3.3.5-2.2.0

# RUN apt-get update && apt-get -y install git

# COPY ./plugin_requirements.txt /
COPY ./plugins.py /etc/netbox/config/plugins.py

RUN /opt/netbox/venv/bin/pip install --no-cache-dir --no-warn-script-location \
    netbox_dns==0.14.0 \
    netbox_documents==0.3.1 \
    django-storages[azure]

RUN SECRET_KEY="dummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input

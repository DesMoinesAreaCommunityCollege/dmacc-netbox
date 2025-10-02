"""Configure Netbox plugins."""

PLUGINS = [
    "netbox_custom_objects",
    "netbox_dns",
    "netbox_documents",
    # "netbox_reorder_rack",
    # "netbox_topology_views",
    # "netbox_webhook_receiver",
    # "netbox_prometheus_sd",
]

PLUGINS_CONFIG = {
    "netbox_documents": {
        "enable_site_documents": True,
        "enable_circuit_documents": True,
        "enable_device_documents": True,
        "enable_device_type_documents": True,
        "enable_navigation_menu": True,
        "site_documents_location": "left",
        "circuit_documents_location": "left",
        "device_documents_location": "left",
        "device_type_documents_location": "left",
    }
}

"""Configure Netbox plugins."""

PLUGINS = ["netbox_dns", "netbox_documents"]

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

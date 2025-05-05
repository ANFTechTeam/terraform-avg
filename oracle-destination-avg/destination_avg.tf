// Deploys the destination Azure NetApp Files application volume group for the replication
resource "azapi_resource" "destination_avg" {
    depends_on = []
    type = "Microsoft.NetApp/netAppAccounts/volumeGroups@2025-01-01"
    schema_validation_enabled = false
    name = var.dst_avg_name
    parent_id = var.dst_avg_rg_netappAccount_resourceId
    body = {
        location = var.dst_avg_rg_location
        properties = {
            "groupMetaData": {
                "groupDescription": var.dst_avg_applicationDescription,
                "applicationType": var.dst_avg_applicationType,
                "applicationIdentifier": var.dst_avg_applicationIdentifier
            },
            "volumes": [
                for volume in var.dst_volumes : {
                    "name": volume.avg_anf_volume_name,
                    "zones": [
                        var.dst_avg_zone
                    ],
                    "properties": {
                        "creationToken": volume.avg_anf_volume_name,
                        "serviceLevel": var.dst_avg_anf_pool_service_level,
                        "throughputMibps": volume.avg_anf_volume_tput,
                        "exportPolicy": {
                            "rules": [
                                {
                                "ruleIndex": 1,
                                "unixReadOnly": true,
                                "unixReadWrite": true,
                                "kerberos5ReadOnly": false,
                                "kerberos5ReadWrite": false,
                                "kerberos5iReadOnly": false,
                                "kerberos5iReadWrite": false,
                                "kerberos5pReadOnly": false,
                                "kerberos5pReadWrite": false,
                                "cifs": false,
                                "nfsv3": (var.dst_avg_anf_volume_protocol_type == "NFSv3" ? true : false),
                                "nfsv41": (var.dst_avg_anf_volume_protocol_type == "NFSv4.1" ? true : false),
                                "allowedClients": "0.0.0.0/0",
                                "hasRootAccess": true
                                }
                            ]
                        },
                        "protocolTypes": [
                            var.dst_avg_anf_volume_protocol_type
                        ],
                        "subnetId": var.dst_avg_VNet_anfSubnet_resourceId,
                        "networkFeatures": "Standard",
                        "usageThreshold": volume.avg_anf_volume_size_bytes,
                        "volumeSpecName": volume.avg_anf_volume_spec_name,
                        "capacityPoolResourceId": var.dst_avg_anf_pool_resourceId,
                        "volumeType": "DataProtection",
                        "dataProtection": {
                            "replication": {
                                "endpointType": "dst",
                                "remoteVolumeResourceId": volume.avg_anf_volume_source_resourceId,
                                "replicationSchedule": volume.avg_anf_volume_replication_schedule
                            }
                        }
                    }
                }
            ]
        }
    }
}
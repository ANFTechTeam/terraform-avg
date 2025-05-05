variable "dst_avg_name" {
    description = "Name of the destination AVG"
}

variable "dst_avg_applicationType" {
    description = "Application type of the destination AVG"
    default     = "ORACLE"
}

variable "dst_avg_applicationDescription" {
    description = "Application description of the destination AVG"
    default     = "Destination AVG for Oracle"
}

variable "dst_avg_applicationIdentifier" {
    description = "Application identifier of the destination AVG"
    default     = "OR1"
}

variable "dst_avg_rg_name" {
    description   = "Name of RG containing the destination AVG"
    default       = ""
}

variable "dst_avg_rg_location" {
    description = "Location of RG containing the destination AVG"
    default     = ""
}

variable "dst_avg_rg_netappAccount_resourceId" {
    description = "Resource ID of the RG containing the destination AVG"
}

variable "dst_avg_VNet_anfSubnet_resourceId" {
    description = "Resource ID of the destination delegated subnet"
}

variable "dst_avg_zone" {
    description = "Zone of the destination AVG"
}

variable "dst_avg_anf_pool_resourceId" {
    description = "Resource ID of the destination ANF capacity pool"
}

variable "dst_avg_anf_pool_service_level" {
    description = "Service level of the destination ANF capacity pool"
}

variable "dst_avg_anf_volume_protocol_type" {
    description = "Protocol type of the destination AVG (NFSv3 or NFSv4.1)"
    default     = "NFSv3"
}

variable "dst_volumes" {
    description = "List of destination volumes to be created"
    type        = list(object({
        avg_anf_volume_source_resourceId      = string
        avg_anf_volume_name                   = string
        avg_anf_volume_size_bytes             = number
        avg_anf_volume_tput                   = number
        avg_anf_volume_spec_name              = string
        avg_anf_volume_replication_schedule   = string
    }))
}
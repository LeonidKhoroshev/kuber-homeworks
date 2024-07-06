
### Cloud vars

variable "token" {
  description = "Yandex Cloud OAuth token"
  type        = string
}

variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID"
  type        = string
}

variable "default_zone" {
  description = "Default zone for Yandex Cloud resources"
  type        = string
}

### Variables for control-plane node

variable "control_plane_name" {
  type        = string
  default     = "control-plane"
}

variable "platform" {
  type        = string
  default     = "standard-v1"
}

variable "control_plane_core" { 
  type        = number
  default     = "4"
}

variable "control_plane_memory" {
  type        = number
  default     = "8"
}

variable "control_plane_core_fraction" {
  description = "guaranteed vCPU, for yandex cloud - 20, 50 or 100 "
  type        = number
  default     = "20"
}

variable "control_plane_disk_size" {
  type        = number
  default     = "50"
}

variable "image_id" {
  type        = string
  default     = "fd893ak78u3rh37q3ekn"
}

variable "scheduling_policy" {
  type        = bool
  default     = "true"
}

variable "subnet_id" {
  type        = string
  default     = "e9b1bo21rhd37h7ajmmp"
}

### Variables for worker nodes

variable "worker_count" {
  type        = number
  default     = "4"
}

variable "worker_platform" {
  type        = string
  default     = "standard-v1"
}

variable "worker_cores" {
  type        = number
  default     = "4"
}

variable "worker_memory" {
  type        = number
  default     = "4"
}

variable "worker_core_fraction" {
  description = "guaranteed vCPU, for yandex cloud - 20, 50 or 100 "
  type        = number
  default     = "20"
}

variable "worker_disk_size" {
  type        = number
  default     = "50"
}

variable "nat" {
  type        = bool
  default     = "true"
}

### Variables for cloud-init

variable "ssh_private_key_path" {
  type        = string
  default     = "/root/.ssh/id_rsa"
}

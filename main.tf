resource "yandex_compute_instance" "control-plane" {
  name            = var.control_plane_name
  platform_id     = var.platform
  resources {
    cores         = var.control_plane_core
    memory        = var.control_plane_memory
    core_fraction = var.control_plane_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.control_plane_disk_size
    }
  }

  scheduling_policy {
    preemptible = var.scheduling_policy
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.nat
  }

  metadata = {
    user-data = "${file("/home/leo/kuber-homeworks/3.2/terraform/cloud-init.yaml")}"
 }
}

resource "yandex_compute_instance" "worker" {
  count           = var.worker_count
  name            = "worker-node-${count.index + 1}"
  platform_id     = var.worker_platform
  resources {
    cores         = var.worker_cores
    memory        = var.worker_memory
    core_fraction = var.worker_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.worker_disk_size
    }
  }

    scheduling_policy {
    preemptible = var.scheduling_policy
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.nat
  }

  metadata = {
    user-data = "${file("/home/leo/kuber-homeworks/3.2/terraform/cloud-init.yaml")}"
 }
}

#resource "local_file" "hosts_cfg" {
#  filename = "/home/leo/kuber-homeworks/3.2/kubespray/inventory/sample/hosts.cfg"
#  content = templatefile("./hosts.tftpl", {
#    control_plane = [yandex_compute_instance.control-plane],
#    worker = yandex_compute_instance.worker
#  })
#}


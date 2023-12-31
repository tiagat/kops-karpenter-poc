resource "kops_instance_group" "master" {

  cluster_name        = kops_cluster.cluster.name
  name                = "control-plane"
  role                = "Master"
  min_size            = 1
  max_size            = 1
  machine_type        = var.master_machine_type
  subnets             = ["subnet-public"]
  associate_public_ip = true
  depends_on          = [kops_cluster.cluster]

}

resource "kops_instance_group" "node" {

  cluster_name        = kops_cluster.cluster.name
  name                = "node"
  role                = "Node"
  min_size            = var.node_min_size
  max_size            = var.node_max_size
  machine_type        = var.node_machine_type
  associate_public_ip = true
  subnets             = ["subnet-public"]
  root_volume_size    = 100

  depends_on = [kops_cluster.cluster]

}

## Copyright (c) 2020, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl



resource "null_resource" "Login2OCIR" {
  provisioner "local-exec" {
    command = "echo '${var.ocir_user_password}' |  docker login ${local.ocir_docker_repository} --username ${local.ocir_namespace}/${var.ocir_user_name} --password-stdin"
  }
}


resource "null_resource" "baggage-tracking-apiPush2OCIR" {
  depends_on = [null_resource.Login2OCIR
			   ]

  provisioner "local-exec" {
    command = "image=$(docker images | grep baggage-tracking-api | awk -F ' ' '{print $3}') ; docker rmi -f $image &> /dev/null ; echo $image"
    working_dir = "functions-fn/api/baggage-tracking-api/"
  }

  provisioner "local-exec" {
    command = "fn build "
    working_dir = "functions-fn/api/baggage-tracking-api/"
  }

  provisioner "local-exec" {
    command = "image=$(docker images | grep baggage-tracking-api | awk -F ' ' '{print $3}') ; docker tag $image ${local.ocir_docker_repository}/${local.ocir_namespace}/${var.ocir_repo_name}/baggage-tracking-api:0.0.1"
    working_dir = "functions-fn/api/baggage-tracking-api/"
  }

  provisioner "local-exec" {
    command = "docker push ${local.ocir_docker_repository}/${local.ocir_namespace}/${var.ocir_repo_name}/baggage-tracking-api:0.0.1"
    working_dir = "functions-fn/api/baggage-tracking-api/"
  }
}

resource "null_resource" "baggage-tracking-keyval-loadPush2OCIR" {
  depends_on = [null_resource.Login2OCIR
			   ]

  provisioner "local-exec" {
    command = "image=$(docker images | grep baggage-tracking-keyval-load | awk -F ' ' '{print $3}') ; docker rmi -f $image &> /dev/null ; echo $image"
    working_dir = "functions-fn/load/baggage-tracking-keyval-load/"
  }

  provisioner "local-exec" {
    command = "fn build "
    working_dir = "functions-fn/load/baggage-tracking-keyval-load/"
  }

  provisioner "local-exec" {
    command = "image=$(docker images | grep baggage-tracking-keyval-load | awk -F ' ' '{print $3}') ; docker tag $image ${local.ocir_docker_repository}/${local.ocir_namespace}/${var.ocir_repo_name}/baggage-tracking-keyval-load:0.0.1"
    working_dir = "functions-fn/load/baggage-tracking-keyval-load/"
  }

  provisioner "local-exec" {
    command = "docker push ${local.ocir_docker_repository}/${local.ocir_namespace}/${var.ocir_repo_name}/baggage-tracking-keyval-load:0.0.1"
    working_dir = "functions-fn/load/baggage-tracking-keyval-load/"
  }
}

resource "null_resource" "baggage-tracking-loadPush2OCIR" {
  depends_on = [null_resource.Login2OCIR
			   ]

  provisioner "local-exec" {
    command = "image=$(docker images | grep baggage-tracking-load | awk -F ' ' '{print $3}') ; docker rmi -f $image &> /dev/null ; echo $image"
    working_dir = "functions-fn/load/baggage-tracking-load/"
  }

  provisioner "local-exec" {
    command = "fn build "
    working_dir = "functions-fn/load/baggage-tracking-load/"
  }

  provisioner "local-exec" {
    command = "image=$(docker images | grep baggage-tracking-load | awk -F ' ' '{print $3}') ; docker tag $image ${local.ocir_docker_repository}/${local.ocir_namespace}/${var.ocir_repo_name}/baggage-tracking-load:0.0.1"
    working_dir = "functions-fn/load/baggage-tracking-load/"
  }

  provisioner "local-exec" {
    command = "docker push ${local.ocir_docker_repository}/${local.ocir_namespace}/${var.ocir_repo_name}/baggage-tracking-load:0.0.1"
    working_dir = "functions-fn/load/baggage-tracking-load/"
  }
}



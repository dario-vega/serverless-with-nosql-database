## This configuration was generated by terraform-provider-oci

resource oci_functions_application export_baggage-tracking {
  compartment_id = var.compartment_ocid
  config = {
    "NOSQL_COMPARTMENT_ID" = var.compartment_ocid
    "NOSQL_REGION"         = var.region
  }
  defined_tags = {
  }
  display_name = "baggage-tracking"
  freeform_tags = {
  }
  subnet_ids = [
    oci_core_subnet.export_Public-Subnet-vcn-baggage-tracking.id,
  ]
  syslog_url = ""
  trace_config {
    domain_id  = ""
    is_enabled = "false"
  }
}

resource oci_functions_function export_baggage-tracking-api {
  depends_on     = [null_resource.baggage-tracking-apiPush2OCIR]
  application_id = oci_functions_application.export_baggage-tracking.id
  config = {
  }
  defined_tags = {
  }
  display_name = "baggage-tracking-api"
  freeform_tags = {
  }
  image              = "${local.ocir_docker_repository}/${local.ocir_namespace}/${var.ocir_repo_name}/baggage-tracking-api:0.0.1"
  memory_in_mbs      = "256"
  timeout_in_seconds = "120"
  trace_config {
    is_enabled = "false"
  }
}

resource oci_functions_function export_baggage-tracking-keyval-load {
  depends_on     = [null_resource.baggage-tracking-keyval-loadPush2OCIR]
  application_id = oci_functions_application.export_baggage-tracking.id
  config = {
  }
  defined_tags = {
  }
  display_name = "baggage-tracking-keyval-load"
  freeform_tags = {
  }
  image              = "${local.ocir_docker_repository}/${local.ocir_namespace}/${var.ocir_repo_name}/baggage-tracking-keyval-load:0.0.1"
  memory_in_mbs      = "256"
  timeout_in_seconds = "120"
  trace_config {
    is_enabled = "false"
  }
}

resource oci_functions_function export_baggage-tracking-load {
  depends_on     = [null_resource.baggage-tracking-loadPush2OCIR]
  application_id = oci_functions_application.export_baggage-tracking.id
  config = {
  }
  defined_tags = {
  }
  display_name = "baggage-tracking-load"
  freeform_tags = {
  }
  image              = "${local.ocir_docker_repository}/${local.ocir_namespace}/${var.ocir_repo_name}/baggage-tracking-load:0.0.1"
  memory_in_mbs      = "256"
  timeout_in_seconds = "120"
  trace_config {
    is_enabled = "false"
  }
}



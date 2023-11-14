terraform {
  required_providers {
    airbyte = {
      source  = "airbytehq/airbyte"
      version = "0.3.3"
    }
  }
}

provider "airbyte" {
  // If running on Airbyte Cloud,
  // generate & save your API key from https://portal.airbyte.com
  bearer_auth = var.api_key
  server_url = "https://"
}

resource "airbyte_source_postgres" "postgres_kebir_allade" {
  configuration = {
    database = "testsnow"
    host     = "testsnow.ce4ajp2z0nkq.eu-west-1.rds.amazonaws.com"
    password = "testsnow"
    port     = 5432
    replication_method = {
      source_postgres_update_replication_method_standard_xmin = {
        method = "Xmin"
      }
    }
    schemas = [
      "public"
    ]
    source_type = "postgres"
    ssl_mode = {
      source_postgres_ssl_modes_allow = {
        mode = "allow"
      }
    }
    tunnel_method = {
      source_postgres_ssh_tunnel_method_no_tunnel = {
        tunnel_method = "NO_TUNNEL"
      }
    }
    username = "testsnow"
  }
  name         = "post kebir"
  workspace_id = var.workspace_id

}
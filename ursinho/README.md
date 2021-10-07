# Bastion host no GCP

## Requisitos
- Terraform instalado
- Acesso de editor em um projeto no GCP
- Preferivelmente uma conta de serviço

Caso precise instalar Terraform, faça o download [aqui](https://www.terraform.io/downloads.html). Depois de baixá-lo, coloque-o em uma pasta e adicione essa pasta à variável de ambiente `PATH` (ou coloque o Terraform em uma pasta que já esteja no `PATH`). Para testar, abra um terminal e digite `terraform version`. A versão do Terraform deverá aparecer na tela.

As formas para o Terraform autenticar no GCP estão detalhadas [aqui](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference). Recomendo o método descrito em ["Running Terraform outside of Google Cloud"](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#running-terraform-on-google-cloud), que consiste em fazer o download da chave de acesso em formato JSON e criar uma variável `GOOGLE_APPLICATION_CREDENTIALS` com o caminho para o arquivo.

Uma vez com o acesso configurado, descomente e preencha as variáveis em **terraform.tfvars** e por fim rode `terraform init`, seguindo de `terraform plan` e por fim `terraform apply`
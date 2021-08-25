---
name: "[session-2]"
about: Segunda sessão
title: "[session-2] Terraform, uma breve introdução"
labels: session, pt-br, pactical
assignees: vflopes

---

# Terraform

O [Terraform](https://www.terraform.io/) é uma ferramenta para provisionar recursos de infraestrutura orquestrando seus possíveis estados através de arquivos de configuração declarativos. A forma mais comum de usá-lo é como uma [CLI](https://pt.wikipedia.org/wiki/Interface_de_linha_de_comandos). Exemplos:

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```

**Dica:** todos esses comandos aceitam parâmetros, para ver quais são os parâmetros aceitos por cada você pode adicionar um `-h` ao comando ou entrar na página de [referência dos comandos do Terraform](https://www.terraform.io/docs/cli/index.html). O exemplo abaixo é da saída após a execução do comando `terraform plan -h`:

```
Usage: terraform [global options] plan [options]

  Generates a speculative execution plan, showing what actions Terraform
  would take to apply the current configuration. This command will not
  actually perform the planned actions.

  You can optionally save the plan to a file, which you can then pass to
  the "apply" command to perform exactly the actions described in the plan.

Plan Customization Options:

  The following options customize how Terraform will produce its plan. You
  can also use these options when you run "terraform apply" without passing
  it a saved plan, in order to plan and apply in a single command.

  -destroy            Select the "destroy" planning mode, which creates a plan
                      to destroy all objects currently managed by this
                      Terraform configuration instead of the usual behavior.

  -refresh-only       Select the "refresh only" planning mode, which checks
                      whether remote objects still match the outcome of the
                      most recent Terraform apply but does not propose any
                      actions to undo any changes made outside of Terraform.

  -refresh=false      Skip checking for external changes to remote objects
                      while creating the plan. This can potentially make
                      planning faster, but at the expense of possibly planning
                      against a stale record of the remote system state.

  -replace=resource   Force replacement of a particular resource instance using
                      its resource address. If the plan would've normally
                      produced an update or no-op action for this instance,
                      Terraform will plan to replace it instead.

  -target=resource    Limit the planning operation to only the given module,
                      resource, or resource instance and all of its
                      dependencies. You can use this option multiple times to
                      include more than one object. This is for exceptional
                      use only.

  -var 'foo=bar'      Set a value for one of the input variables in the root
                      module of the configuration. Use this option more than
                      once to set more than one variable.

  -var-file=filename  Load variable values from the given file, in addition
                      to the default files terraform.tfvars and *.auto.tfvars.
                      Use this option more than once to include more than one
                      variables file.

Other Options:

  -compact-warnings   If Terraform produces any warnings that are not
                      accompanied by errors, shows them in a more compact form
                      that includes only the summary messages.

  -detailed-exitcode  Return detailed exit codes when the command exits. This
                      will change the meaning of exit codes to:
                      0 - Succeeded, diff is empty (no changes)
                      1 - Errored
                      2 - Succeeded, there is a diff

  -input=true         Ask for input for variables if not directly set.

  -lock=false         Don't hold a state lock during the operation. This is
                      dangerous if others might concurrently run commands
                      against the same workspace.

  -lock-timeout=0s    Duration to retry a state lock.

  -no-color           If specified, output won't contain any color.

  -out=path           Write a plan file to the given path. This can be used as
                      input to the "apply" command.

  -parallelism=n      Limit the number of concurrent operations. Defaults to 10.

  -state=statefile    A legacy option used for the local backend only. See the
                      local backend's documentation for more information.
```

# Feedback da sessão

Dê uma reação com os emojis para ajudar na melhoria contínua do curso: 

- 🎉 Está incrível!
- ❤️️ Está muito legal!
- 👍 Está legal.
- 👎 Não gostei ou não consegui acompanhar.
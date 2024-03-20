# Practice Labs - Lab 04: 

Trabalhando com variáveis

Instruções:

Para cada laboratório, crie um novo diretório. Caso haja qualquer erro, leia atentamente o terminal. Sempre que possível utilize referências implicitas para garantir que sua infra seja criada na ordem correta.

Durante esse laboratório vamos alterar a infra criada no LAB 02, transformando todos os parâmetros possíveis em `variables` e/ou `locals` quando for mais conveniente.

Para simplificar a validação das alterações copie inicialmente apenas os arquivos que fazem a definição da rede e depois os arquivos que definem a camada de processamento.

Além disso será criado uma configuração de output para exibir algumas informações das instâncias criadas. 

## DOC DE REFERÊNCIA TERRAFORM

1. [HCL Reference - Local Values](https://www.terraform.io/language/values/locals "HCL Reference - Local Values")
2. [HCL Reference - Variables](https://www.terraform.io/language/values/variables "HCL Reference - Variables")
3. [HCL Reference - Outputs](https://www.terraform.io/language/values/outputs "HCL Reference - Outputs")
4. [HCL Reference - Functions - Format](https://developer.hashicorp.com/terraform/language/functions/format "HCL Reference - Functions - Format")

## Preparando a Rede

1. Crie um novo diretório com o nome LAB04.

1. Crie um novo arquivo variables.tf vazio.

    ### Alterando a configuração da rede.

    **- Na primeira parte** serão alterados as configurações do ambiente de network, para o uso de variáveis e locals. Todas as demais definições de referenciamento, zonas e ips devem permanecer as mesmas do LAB02, apenas substituir nos códigos dos recursos os valores literais por variáveis.

1. Copie os arquivos com a definição do **provider** e os que contem as definições da **vpc**, **vpc resources**, **subnets** e **security groups** da pasta do LAB02 para a pasta do LAB04.

1. Crie 1 variável para armazenar o nome a ser usado na VPC, faça a alteração correspondente no arquivo de configuração da VPC.

1. Crie 1 variável para armazanar o endereço CIDR a ser usado na vpc, faça a alteração correspondente no arquivo de configuração da VPC.

1. Altere a tag de nome dos recursos `internet_gateway` e `route_table` de modo que o nome definido para vpc seja adicionado dinamicacmente ao prefixo do recurso ex.: `rt_public_<nome_da_vpc>`

1. Crie variáveis para armazenar os valores `cidr_block` e `availability_zone` para as subnet1 e subnet2, faça a alteração no arquivo correspondente para passar a usar as variáveis (defina os valores a serem utilizados como default ou passe os valores em um arquivos terraform.tfvars)

1. Crie 1 variável booleana com o nome `public_ip_enabled` **sem valor padrão**. Altere o arquivo de subnets para passar a variável como valor para o parâmetro `map_public_ip_on_launch`.

    `
    Dica1: lembre-se de passar o valor **true** no momento da execução, já que estamos criando duas subnets publicas
    Dica2: as duas subnets devem ter o parâmetro **map_public_ip_on_launch** definido
    `

1. Altere as tags de nome das subnets de modo que o nome da subnet a ser exibido tenha o formato: `subnet_<nome_da_vpc>_<zona>`;

1. Altere os security groups para que os nomes dos securitygroups e as tags Name tenham o formato: `nome_do_securitygroup_<nome_vpc>_sg`;

1. **Valide**, **Planeje** e **Aplique** as configuração alteradas até aqui, observe se os elementos foram criados na ordem correta obedecendo as dependências definidas.

1. Valide via `terraform state list` e também via console que o ambiente foi criado corretamente.

    ### Alterando o ambiente de processamento para uso de variáveis

    - **Na segunda parte do LAB** serão alterados as configurações do ambiente de processamento, para o uso de variáveis e locals. Todas as demais definições de referenciamento, zonas e ips devem permanecer as mesmas do LAB02, apenas substituir nos códigos dos recursos os valores literais por variáveis.

1. Copie os arquivos que contem as definições do **disco** e das instâncias, **dbserver1**, **web1** e **web2** da pasta do LAB02 para a pasta do LAB04.

1.  Crie um novo arquivo locals e defina um novo `local` com o nome **db_zone**, para definir qual zona (us-east1-c) deve ser utilizada para criar o disco e também o servidor de banco.

1. Crie uma variável do tipo number para definir o tamanho do disco a ser criado. Faça as alterações devidas no arquivo do disco.

1.  **Instância dbserver1**: Crie variáveis para armazenar os valores `Name`, `instance_type` e `ami` para a instância **dbserver1**. Faça a alteração no arquivo correspondente para passar a usar as variáveis. (Defina os valores a serem utilizados como default ou passe os valores em um arquivos terraform.tfvars)

1. **Instâncias web1 e web2**: Crie variáveis para armazenar os valores de `Name`, `instance_type`, `ami` para as instâncias **web1** e **web2**. Faça a alteração no(s) arquivo(s) correspondente(s) para passar a usar as variáveis. (defina os valores a serem utilizados como default ou passe os valores em um arquivos terraform.tfvars)

1. Crie uma variável para armazenar o valor a ser chamado em `user_data`.

##### Criando os arquivos de output

1. Crie um novo arquivo de output que exiba na saída as seguintes informações para as 3 instâncias do ambiente:

- availability_zone;
- private_ip
- public_ip;

1. **Valide**, **planeje** e **aplique** as configurações observe se os elementos foram criados na ordem correta obedecendo as dependências definidas.

1. Valide via `terraform state` e também via console que o ambiente foi criado corretamente.

##### Validando o ambiente criado

1. Acesse o SSH da instância dbsever1 via console e valide quantos discos existem. Dica: use o comando `lsblk`. (Dica: o disco deve ser listado como um dispositivo `sdb`)

1. Em um browser acesse os ips públicos dos servidores web1 e web2 para garantir que o nginx foi instalado.

1. Destrua todo o ambiente e valide que todos os elementos foram removidos via validação do state e também via console.

##### Criando o ambiente completo, com um só comando.

1. Execute novamente o comando apply para recriar todo o ambiente e teste novamente os acessos ao nginx.

1. Destrua todo o ambiente e valide que todos os elementos foram removidos via validação do state e também via console.
`
Obs: lembre-se de ao final destruir sua infraestrutura por questões de billing e manutenção sadia da sua free tier.
`
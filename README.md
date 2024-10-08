# BUSCA CEP

Temos um novo projeto na empresa, onde precisaremos disponibilizar ao usuário do nosso sistema acessar informações
de endereço de um determinado CEP.
Para isso, podemos contar com a api de viacep (https://viacep.com.br/) que nos retorna essa informação.
Porém, não podemos contar que o viacep esteja online em 100% do tempo e pra não corrermos o risco de darmos um
erro ao nosso cliente, podemos contar também com a apicep (https://apicep.com/api-de-consulta/) para o caso do
viacep estar fora do ar.
Para não darmos o azar de pegarmos os 2 serviços fora do ar, contaremos com a awesomeapi
(https://docs.awesomeapi.com.br/api-cep) para diminuírmos ainda mais o risco do nosso cliente receber uma resposta
de erro.


## 🚀 Aplicações
```
pasta onde ficam os executáveis \projeto_totvs\bin
CEPServer.exe - > Serviço API para acesso
                  Documentação Swagger -> http://localhost:9901/v1/swagger/doc/html
CEPClient.exe - > Exemcplo de como acessar os endpoints
TestesCEPClient.exe -> Testes unitário
```
## 🚀 Começando

Essas instruções permitirão que você obtenha uma cópia do projeto em operação na sua máquina local para fins de desenvolvimento e teste.

Criado com Delphi utilizando Biblioteca Horse para criação de API 


### 📋 Pré-requisitos

De que coisas você precisa para instalar o software e como instalá-lo?

```
boss
na pasta \projeto_totvs\Server
boss update
```

### 🔧 Instalação

Para baixar via link do GitHub
Diga como essa etapa será:

```
git clone https://github.com/avelsys/projeto_totvs.git
```


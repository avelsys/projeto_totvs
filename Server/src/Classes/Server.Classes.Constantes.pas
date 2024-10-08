unit Server.Classes.Constantes;

interface

const
  C_LOGGER_CONFIG                   = ' ${request_clientip} [${time}] ${request_user_agent} "${request_method} ${request_path_info} ${request_version}" ${response_status} ${response_content_length} ${response_content}';
  C_LOGGER_PATH_ARQUIVO             = '.\Logs\Server';

  C_API_TITLE                       = 'Servidor Busca Ceps rodando na porda %d, MODO: %s ';
  C_API_MODO_OPERACAO_HOMOLOGACAO   = 'HOMOLOGAÇÃO';
  C_API_CHAVE                       = 'TOTVS_BUSCA_CEP';

  C_API_RESQUEST_CEP_VIACEP         = 'https://viacep.com.br/ws/%s/json/';
  C_API_RESQUEST_CEP_APICEP         = 'https://apicep.com/api/v1/cep/%s.json';
  C_API_RESQUEST_CEP_AWESSOMEAPI    = 'https://cep.awesomeapi.com.br/json/%s';

  C_API_PATH_CEP_VIACEP             = 'https://viacep.com.br';
  C_API_PATH_CEP_APICEP             = 'https://apicep.com';
  C_API_PATH_CEP_AWESSOMEAPI        = 'https://cep.awesomeapi.com.br';


  C_SWAGGER_PATH_HTML               = '%s/swagger/doc/html';
  C_SWAGGER_PATH_JSON               = '%s/swagger/doc/json';
  C_SWAGGER_PATH_VERSAO             = 'v1';
  C_SWAGGER_TITLE                   = 'ServerCEP - Api de Busca de CEPS.';
  C_SWAGGER_VERSAO_INFO             = '1.0.0';
  C_SWAGGER_DESCRICAO               = 'Documentação de busca de CEPS';
  C_SWAGGER_CONTACT_NAME            = 'Alessandro Avelino';
  C_SWAGGER_CONTACT_EMAIL           = 'avelinoalessandro@gmail.com';



implementation

end.

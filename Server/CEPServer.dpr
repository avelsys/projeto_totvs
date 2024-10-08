program CEPServer;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  Horse,
  Horse.Logger,
  Horse.Logger.Provider.LogFile,
  Horse.CORS,
  Horse.JWT,
  Horse.HandleException,
  Horse.Jhonson,
  Horse.GBSwagger,
  Server.Classes.Constantes in 'src\Classes\Server.Classes.Constantes.pas',
  Server.Controller.HeaderSwagger in 'src\Controller\Server.Controller.HeaderSwagger.pas',
  Server.Model.Cep.Interfaces in 'src\Model\Server.Model.Cep.Interfaces.pas',
  Server.Controller.Cep.ViaCep in 'src\Controller\Server.Controller.Cep.ViaCep.pas',
  Server.Controller.Cep.Factory in 'src\Controller\Server.Controller.Cep.Factory.pas',
  Server.Service.BuscaCep in 'src\Service\Server.Service.BuscaCep.pas',
  Server.Controller.Cep.ApiCep in 'src\Controller\Server.Controller.Cep.ApiCep.pas',
  Server.Controller.Cep.Awessomeapicep in 'src\Controller\Server.Controller.Cep.Awessomeapicep.pas',
  Server.Classes.Helpers in 'src\Classes\Server.Classes.Helpers.pas',
  Commons.DTO.Cep in '..\Commons\DTO\Commons.DTO.Cep.pas',
  Commons.DTO.Erro in '..\Commons\DTO\Commons.DTO.Erro.pas',
  Commons.Funcoes in '..\Commons\Commons.Funcoes.pas';

var
   LLogFileConfig: THorseLoggerLogFileConfig;
begin
  ReportMemoryLeaksOnShutdown := True;

  LLogFileConfig := THorseLoggerLogFileConfig.New
   .SetLogFormat(C_LOGGER_CONFIG)
     .SetDir(C_LOGGER_PATH_ARQUIVO);

  THorseLoggerManager.RegisterProvider(THorseLoggerProviderLogFile.New(LLogFileConfig));

  THorse
    .Use(THorseLoggerManager.HorseCallback)
    .Use(CORS)
    .Use(Jhonson())
    .Use(HandleException)
    .Use(HorseSwagger(Format(C_SWAGGER_PATH_HTML, [C_SWAGGER_PATH_VERSAO]),
                      Format(C_SWAGGER_PATH_JSON, [C_SWAGGER_PATH_VERSAO])));
  // Endereço de documentação Swagger: http://localhost:9901/v1/swagger/doc/html

  TControllerHeaderSwagger.SetarCabecalho;

  //Endpoint: http://localhost:9901/v1/buscacep/<CEP>
  THorseGBSwaggerRegister.RegisterPath(TServiceBuscaCep);

  THorse.Listen(9901,
    procedure
    begin
      Writeln(Format(C_API_TITLE,[THorse.Port, C_API_MODO_OPERACAO_HOMOLOGACAO]));
      Readln
    end);

end.

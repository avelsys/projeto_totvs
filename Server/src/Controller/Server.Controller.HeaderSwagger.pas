unit Server.Controller.HeaderSwagger;

interface
uses
  System.SysUtils,
  System.Classes,
  Horse.GBSwagger,
  Horse.JWT,
  Server.Classes.Constantes,
  Commons.DTO.Erro;

type
  TControllerHeaderSwagger = class
  public
    class procedure SetarCabecalho;
  end;

implementation

{ TControllerHeaderSwagger }

class procedure TControllerHeaderSwagger.SetarCabecalho;
begin
  Swagger
    .BasePath(C_SWAGGER_PATH_VERSAO)
    .Register
      .SchemaOnError(TErrorDTO)
    .&End
    .Info
      .Title(C_SWAGGER_TITLE)
      .Version(C_SWAGGER_VERSAO_INFO)
      .Description(C_SWAGGER_DESCRICAO)
      .Contact
        .Name(C_SWAGGER_CONTACT_NAME)
        .Email(C_SWAGGER_CONTACT_EMAIL)
      .&end
    .&End
    .AddProtocol(TGBSwaggerProtocol.gbHttp)
//    .AddBearerSecurity
//      .AddCallback(HorseJWT(C_API_CHAVE))
    .&end;
end;

end.

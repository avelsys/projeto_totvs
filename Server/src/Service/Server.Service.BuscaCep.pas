unit Server.Service.BuscaCep;

interface

uses
  System.AnsiStrings,
  System.SysUtils,
  System.JSON,
  Horse,
  Horse.Exception,
  Horse.GBSwagger,
  GBSwagger.Path.Attributes,
  Commons.DTO.Erro,
  Commons.DTO.Cep,
  Server.Classes.Helpers,
  Server.Classes.Constantes,
  Server.Model.Cep.Interfaces;

const
  C_ListaTipoCep:           array[TTipoApiCep] of TTipoApiCep = (taVIaCep, taApiCep, taAwesomeApi);
  C_ListaTipoCepDescricao:  array[TTipoApiCep] of string = ('VIaCep', 'ApiCep', 'AwesomeApi');

type
  [SwagPath('buscacep','Servi�o para consulta de Ceps')]
  TServiceBuscaCep = class(THorseGBSwagger)
  public
    [SwagGET('{cep}','Digite o Cep.')]
    [SwagParamPath('cep','Cep')]
    [SwagResponse(200, TCepDTO)]
    [SwagResponse(404, TErrorDTO)]
    procedure ObterCep;

  end;

implementation

uses
  Server.Controller.Cep.Factory;

{ TServiceBuscaCep }

procedure TServiceBuscaCep.ObterCep;
var
  LCep: String;
  LTipoApiChave: TTipoApiCep;
  LFactoryCEP: IModelFactoryCep;
  LResponseJSON: TJSONObject;
begin
  LResponseJSON := nil;
  LCep          := FRequest.Params['cep'];
  if LCep.trim.IsEmpty then
    raise EHorseException.New.Error('O campo CEP est� v�zio.').Status(THTTPStatus.BadRequest);

  LFactoryCEP := TControllerCepFactory.new;
  for LTipoApiChave in C_ListaTipoCep do
  begin
    if LFactoryCEP.IsOnLine(LTipoApiChave) then
    begin
      LResponseJSON := LFactoryCEP.ConsultaCep(LCep);
      if not LResponseJSON.IsEmpty then
      begin
        LResponseJSON.AddPair('Servico', C_ListaTipoCepDescricao[LTipoApiChave]);
        FResponse.send(LResponseJSON).Status(THTTPStatus.OK);
        Exit;
      end;
    end;
  end;

  if not LResponseJSON.IsEmpty then
    raise EHorseException.New.Error(Format('CEP [%s] n�o encontrado.',[LCep])).Status(THTTPStatus.NotFound);
end;

end.

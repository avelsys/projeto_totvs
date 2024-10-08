unit Server.Controller.Cep.Factory;

interface

uses
  System.Classes,
  System.SysUtils,
  System.JSON, IdHTTP,
  Horse,
  Server.Model.Cep.Interfaces,
  Server.Classes.Constantes;

type
  TControllerCepFactory = class(TInterfacedObject,  IModelFactoryCep)
    FAPICep: IModelCep;
  private
    function SelecionarAPI(const ATipoAPI: TTipoApiCep): IModelCep;
  public
    class function New: IModelFactoryCep;
    function ConsultaCep(const ACep: string): TJSONObject;
    function IsOnLine(const ATipoApi: TTipoApiCep): boolean;
  end;
implementation

uses
  Server.Controller.Cep.ViaCep,
  Commons.Funcoes, Server.Controller.Cep.ApiCep,
  Server.Controller.Cep.Awessomeapicep;

{ TControllerCepFactory }

class function TControllerCepFactory.New: IModelFactoryCep;
begin
  result := Self.Create
end;

function TControllerCepFactory.ConsultaCep(const ACep: string): TJSONObject;
begin
  result := FAPICep.ConsultaCep(ACep);
end;

function TControllerCepFactory.IsOnLine(const ATipoApi: TTipoApiCep): boolean;
begin
  if Assigned(FAPICep) then
    FAPICep := nil;

  FAPICep :=  SelecionarAPI(ATipoAPI);
  result  := FAPICep.IsOnLine;
end;

function TControllerCepFactory.SelecionarAPI(
  const ATipoAPI: TTipoApiCep): IModelCep;
begin
  case ATipoAPI  of
    taVIaCep:       result := TControllerCepViaCep.New;
    taApiCep:       result := TControllerCepApiCep.New;
    taAwesomeApi:   result := TControllerCepAwesSomeApi.New;
  end;
end;

end.

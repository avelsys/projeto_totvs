unit Server.Controller.Cep.ApiCep;

interface

uses
  System.Classes,
  System.SysUtils,
  System.JSON, IdHTTP,
  Horse,
  Server.Model.Cep.Interfaces,
  Server.Classes.Constantes, IdSSLOpenSSL;

type
  TControllerCepApiCep = class(TInterfacedObject,  IModelCep)
  public
    class function New: IModelCep;
    function ConsultaCep(const ACep: string): TJSONObject;
    function IsOnLine: boolean;
  end;

implementation

uses
  Commons.Funcoes;

{ TControllerCepApiCep }

function TControllerCepApiCep.ConsultaCep(const ACep: string): TJSONObject;
var
  LRequestHTTP: TIdHTTP;
  LSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  LResponse, LRequest: string;
begin
  LRequestHTTP := TIdHTTP.Create(nil);
  try
    LSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    try
      LSSLHandler.SSLOptions.Method       := sslvTLSv1_2;
      LSSLHandler.SSLOptions.SSLVersions  := [sslvTLSv1_2];
      LRequestHTTP.IOHandler              := LSSLHandler;
      LRequest  := Format(C_API_RESQUEST_CEP_APICEP,[ACep]);
      LResponse  := LRequestHTTP.Get(LRequest);
      Result    := TJSONObject.ParseJSONValue(LResponse) as TJSONObject;
    finally
      LSSLHandler.free;
    end;

  finally
    LRequestHTTP.Free;
  end;
end;

function TControllerCepApiCep.IsOnLine: boolean;
begin
  result := IsApiOnline(C_API_PATH_CEP_APICEP);
end;

class function TControllerCepApiCep.New: IModelCep;
begin
  result := Self.create;
end;

end.

unit Server.Controller.Cep.ViaCep;

interface

uses
  System.Classes,
  System.SysUtils,
  System.JSON, IdHTTP,
  Horse,
  Server.Model.Cep.Interfaces,
  Server.Classes.Constantes, IdSSLOpenSSL;

type
  TControllerCepViaCep = class(TInterfacedObject,  IModelCep)
  public
    class function New: IModelCep;
    function ConsultaCep(const ACep: string): TJSONObject;
    function IsOnLine: boolean;
  end;

implementation

uses
  Commons.Funcoes;

{ TControllerCepViaCep }

function TControllerCepViaCep.ConsultaCep(const ACep: string): TJSONObject;
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
      LRequest  := Format(C_API_RESQUEST_CEP_VIACEP,[ACep]);
      LResponse  := LRequestHTTP.Get(LRequest);
      Result    := TJSONObject.ParseJSONValue(LResponse) as TJSONObject;
    finally
      LSSLHandler.free;
    end;

  finally
    LRequestHTTP.Free;
  end;
end;

function TControllerCepViaCep.IsOnLine: boolean;
begin
  result := IsApiOnline(C_API_PATH_CEP_VIACEP);
end;

class function TControllerCepViaCep.New: IModelCep;
begin
  result := Self.create;
end;

end.

unit Client.Controller.Cep;

interface

uses
  System.Net.HttpClient,
  System.JSON,
  System.SysUtils,
  System.Generics.Collections,
  System.Rtti,
  Vcl.StdCtrls,
  Vcl.Dialogs,
  Client.Model.Cep.Interfaces,
  Client.Classe.Constantes,
  Commons.DTO.Cep;

type
  TControllerBuscaCepService<T:Class, constructor> = class(TInterfacedObject, IModelBuscaCepService<T>)
  private
    FClassDTO: T;
    FCep: string;
    FProcRetorno: TNotifyEventRetornoCEP;
    FListaCampos: TListaRetornoCampos;
    /// <summary>
    ///   Realiza a consulta na API
    /// </summary>
    procedure ConsultaCepApi;
    /// <summary>
    ///   Pega os dados de retorno da API compara com as propriedades da Classe DTO
    ///   e gera o range de dados no FListaCampos
    /// </summary>
    /// <param name="ARetornoJSON">
    ///   JSONObject de resposta da API
    /// </param>
    procedure PegarDadosJSON(const ARetornoJSON: TJSONObject);
    constructor Create;
  public
    class function New: IModelBuscaCepService<T>;

    function SetRetorno(const AProcedureRetono:TNotifyEventRetornoCEP): IModelBuscaCepService<T>;
    function ConsultaCep(const ACep: string): IModelBuscaCepService<T>;
    function PegarListaDados: TListaRetornoCampos;
    function PegarValor(const ACampo: string): string;

    destructor Destroy; override;
  end;

implementation

uses
  Commons.Funcoes;

{ TControllerBuscaCepService }

class function TControllerBuscaCepService<T>.New: IModelBuscaCepService<T>;
begin
  Result := Self.Create;
end;

constructor TControllerBuscaCepService<T>.Create;
begin
  FClassDTO     := T.Create;
  FListaCampos  := TListaRetornoCampos.Create;
end;

destructor TControllerBuscaCepService<T>.Destroy;
begin
  if Assigned(FClassDTO) then
    FClassDTO.free;

  if Assigned(FListaCampos) then
    FListaCampos.free;

  inherited;
end;

function TControllerBuscaCepService<T>.SetRetorno(
  const AProcedureRetono: TNotifyEventRetornoCEP): IModelBuscaCepService<T>;
begin
  Result       := Self;
  FProcRetorno := AProcedureRetono;
end;

function TControllerBuscaCepService<T>.ConsultaCep(
  const ACep: string): IModelBuscaCepService<T>;
begin
  Result       := Self;
  FCep := RemoverCaracteresEspeciais(ACep.Trim);
  ConsultaCepApi;
  if (FListaCampos.Count > 0) and Assigned(FProcRetorno) then
    FProcRetorno(FListaCampos);
end;

procedure TControllerBuscaCepService<T>.ConsultaCepApi;
var
  LHTTPClient: THTTPClient;
  LResponse: IHTTPResponse;
  LBaseURL: string;
  LJSONResponse: TJSONObject;
  LCEP, Logradouro, Bairro: string;
begin
  LHTTPClient := THTTPClient.Create;
  try
    LBaseURL  := format(C_APICEP_HOST,[FCep]) ;
    LResponse := LHTTPClient.Get(LBaseURL);
    if LResponse.StatusCode = 200 then
    begin
      LJSONResponse := TJSONObject.ParseJSONValue(LResponse.ContentAsString) as TJSONObject;
      try
        PegarDadosJSON(LJSONResponse)
      finally
        LJSONResponse.Free;
      end;
    end
    else
    begin
      ShowMessage('Erro ao consumir a API: ' + IntToStr(LResponse.StatusCode));
    end;
  finally
    LHTTPClient.Free;
  end;
end;

procedure TControllerBuscaCepService<T>.PegarDadosJSON(const ARetornoJSON: TJSONObject);
var
  LContexto: TRttiContext;
  LTipo: TRttiType;
  LPropriedade: TRttiProperty;
  LJSValor: TJSONValue;
begin
  LContexto := TRttiContext.Create;
  try
    LTipo := LContexto.GetType(TypeInfo(T));
    for LPropriedade in LTipo.GetProperties do
    begin
      LJSValor := ARetornoJSON.FindValue(LPropriedade.Name);
      if LJSValor <> nil then
        FListaCampos.Add(LPropriedade.Name, LJSValor.Value)
    end;
  finally
    LContexto.Free;
  end;
end;

function TControllerBuscaCepService<T>.PegarListaDados: TListaRetornoCampos;
begin
  result := FListaCampos;
end;

function TControllerBuscaCepService<T>.PegarValor(const ACampo: string): string;
begin
  Result := EmptyStr;
  if FListaCampos.ContainsKey(ACampo) then
    Result := FListaCampos[ACampo]
end;

end.

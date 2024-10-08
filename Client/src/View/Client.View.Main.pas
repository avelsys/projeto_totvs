unit Client.View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Client.Model.Cep.Interfaces,
  Commons.DTO.Cep;

type
  TViewMain = class(TForm)
    pnlCep: TPanel;
    lblCep: TLabel;
    edtCep: TEdit;
    btnConsultar: TButton;
    pnlLogradouro: TPanel;
    lblLogradouro: TLabel;
    lblDadoLogradouro: TLabel;
    pnlComplemento: TPanel;
    lblCompemento: TLabel;
    lblDadoComplemento: TLabel;
    pnlBairro: TPanel;
    lblBairro: TLabel;
    lblDadoBairro: TLabel;
    pnlCidade: TPanel;
    lbllocalidade: TLabel;
    lblDadoLocalidade: TLabel;
    pnlUF: TPanel;
    lblUF: TLabel;
    lblDadoUF: TLabel;
    lblFonte: TLabel;
    lblDadoServico: TLabel;
    procedure btnConsultarClick(Sender: TObject);
  private
    procedure RetornoConsumoAPI(const ARetornoAPI: TListaRetornoCampos);

  end;

var
  ViewMain: TViewMain;

implementation

uses
  Client.Controller.Cep;

{$R *.dfm}

procedure TViewMain.btnConsultarClick(Sender: TObject);
var
  LService: IModelBuscaCepService<TCepDTO>;
begin
  LService := TControllerBuscaCepService<TCepDTO>.New;
  LService
    .SetRetorno(RetornoConsumoAPI)
    .ConsultaCep(edtCep.Text)
end;

procedure TViewMain.RetornoConsumoAPI(const ARetornoAPI: TListaRetornoCampos);
var
  LChaveRetorno: string;
  LDadoLabel: TLabel;
begin
  for LChaveRetorno in ARetornoAPI.Keys do
  begin
    LDadoLabel := Self.FindComponent(Format('lblDado%s',[LChaveRetorno])) as TLabel;
    if Assigned(LDadoLabel) then
      LDadoLabel.Caption := ARetornoAPI[LChaveRetorno];
  end;
end;

end.

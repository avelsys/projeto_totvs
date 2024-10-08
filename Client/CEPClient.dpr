program CEPClient;

uses
  Vcl.Forms,
  Client.View.Main in 'src\View\Client.View.Main.pas' {ViewMain},
  Client.Controller.Cep in 'src\Controller\Client.Controller.Cep.pas',
  Client.Model.Cep.Interfaces in 'src\Model\Client.Model.Cep.Interfaces.pas',
  Client.Classe.Constantes in 'src\Classe\Client.Classe.Constantes.pas',
  Commons.Funcoes in '..\Commons\Commons.Funcoes.pas',
  Commons.DTO.Cep in '..\Commons\DTO\Commons.DTO.Cep.pas';

{$R *.res}

begin
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.

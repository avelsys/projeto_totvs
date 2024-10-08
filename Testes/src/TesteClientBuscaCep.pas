unit TesteClientBuscaCep;

interface

uses
  Winapi.Windows,
  Winapi.ShellAPI,
  System.SysUtils,
  Vcl.Forms,
  DUnitX.TestFramework,
  Client.Classe.Constantes,
  Commons.DTO.Cep,
  Client.Model.Cep.Interfaces;

type
  [TestFixture]
  TestBuscaCEP = class
  private
    FService: IModelBuscaCepService<TCepDTO>;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [TestCase('Teste Consulta CEP Campo Vazio logradouro','60348240,logradouro')]
    [TestCase('Teste Consulta CEP Campo Vazio complemento','60348240,complemento')]
    [TestCase('Teste Consulta CEP Campo Vazio bairro','60348240,bairro')]
    [TestCase('Teste Consulta CEP Campo Vazio localidade','60348240,localidade')]
    [TestCase('Teste Consulta CEP Campo Vazio estado','60348240,estado')]
    procedure TestConsultaCep(const ACep: string; const  ACampo: string);

    [TestCase('Teste Valida Campo Existe logradouro','60348240,logradouro')]
    [TestCase('Teste Valida Campo Existe complemento','60348240,complemento')]
    [TestCase('Teste Valida Campo Existe unidade','60348240,unidade')]
    [TestCase('Teste Valida Campo Existe bairro','60348240,bairro')]
    [TestCase('Teste Valida Campo Existe localidade','60348240,localidade')]
    [TestCase('Teste Valida Campo Existe estado','60348240,estado')]
    procedure TestValidaCampoCEP(const ACep: string; const  ACampo: string);

  end;

implementation

uses
  Commons.Funcoes, Client.Controller.Cep;

procedure TestBuscaCEP.Setup;
begin
  Assert.IsTrue(AbreAplicacaoExterna(C_TEST_API_EXE),'Não foi possivel abrir a API');
  FService := TControllerBuscaCepService<TCepDTO>.New;
  Assert.IsTrue(FService <> nil,' A variável responsável pela conexão não foi instânciada corretamente.');
end;

procedure TestBuscaCEP.TearDown;
begin
  Assert.IsTrue(FecharAplicacaoExterna(C_TEST_API_EXE),'Não foi possivel Fechar a API');
end;

procedure TestBuscaCEP.TestConsultaCep(const ACep: string; const  ACampo: string);
begin
  FService.ConsultaCep(ACep);
  Assert.IsNotEmpty(FService.PegarValor('logradouro'),'O campo <<logradouro>> não foi encontrado');
end;

procedure TestBuscaCEP.TestValidaCampoCEP(const ACep: string; const  ACampo: string);
begin
  FService.ConsultaCep(ACep);
  Assert.IsNotEmpty(FService.PegarListaDados.ContainsKey(ACampo), Format('O campo <<%s>> não foi encontrado',[ACampo]));
end;

initialization
  TDUnitX.RegisterTestFixture(TestBuscaCEP);

end.

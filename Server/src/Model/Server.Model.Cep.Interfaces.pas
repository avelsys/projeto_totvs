unit Server.Model.Cep.Interfaces;

interface

uses
  System.JSON;

type
  TTipoApiCep = (taVIaCep, taApiCep, taAwesomeApi);

  IModelCep = interface
    ['{9F0EF2EC-D279-4E45-AA27-1DB2623DA501}']
    /// <summary>
    ///   Realiza a consulta do CEP passamdo por par�metro.
    /// </summary>
    /// <param name="ACep">
    ///   Informe o Cep a ser consultado
    /// </param>
    /// <returns>
    ///   Retorno um  JSON, com as informa��es do cep requisitado
    /// </returns>
    function ConsultaCep(const ACep: string): TJSONObject;
    /// <summary>
    ///   Verifica se a API Selecionada esta funcional
    /// </summary>
    /// <returns>
    ///   Caso a cone�o esteja est�vel retorna verdadeiro.
    /// </returns>
    function IsOnLine: boolean;
  end;

  IModelFactoryCep = interface
    ['{707EB5D8-333E-4444-87EE-EE61221EC8B5}']
    /// <summary>
    ///   Realiza a consulta do CEP passamdo por par�metro.
    /// </summary>
    /// <param name="ACep">
    ///   Informe o Cep a ser consultado
    /// </param>
    /// <returns>
    ///   Retorno um  JSON, com as informa��es do cep requisitado
    /// </returns>
    function ConsultaCep(const ACep: string): TJSONObject;
    /// <summary>
    ///   Verifica se a API Selecionada esta funcional
    /// </summary>
    /// <returns>
    ///   Caso a cone�o esteja est�vel retorna verdadeiro.
    /// </returns>
    function IsOnLine(const ATipoApi: TTipoApiCep): boolean;

  end;

implementation

end.

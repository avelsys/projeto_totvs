unit Client.Model.Cep.Interfaces;

interface
uses
  System.SysUtils,
  System.Generics.Collections;

type
  TListaRetornoCampos      = TDictionary<string, Variant>;
  TNotifyEventRetornoCEP   = procedure(const AListaCampos: TListaRetornoCampos) of object;
  IModelBuscaCepService<T> = interface
    ['{5212AC96-C993-4102-AC3E-6558534BF884}']
    /// <summary>
    ///   Recebe o CEP para o controle realizar a consulta junto a API.
    /// </summary>
    /// <param name="ACep">
    ///   Informe o Cep a ser consultado
    /// </param>
    /// <returns>
    ///   Retorno o SELF da api para uso Fluent
    /// </returns>
    function ConsultaCep(const ACep: string): IModelBuscaCepService<T>;
    /// <summary>
    ///   Recebe uma procedure encapsulada para trabalhar com os dados e informações
    ///   vindas da API
    /// </summary>
    /// <param name="AProcedureRetono">
    ///   Informe a procedure que será usada para processar
    /// </param>
    /// <returns>
    ///   Retorno o SELF da api para uso Fluent
    /// </returns>
    function SetRetorno(const AProcedureRetono:TNotifyEventRetornoCEP): IModelBuscaCepService<T>;
    /// <summary>
    ///   Pegar o valor do campo enviado como parametro
    ///   vindas da API
    /// </summary>
    /// <param name="ACampo">
    ///   Informe o campo que deseja pegar o valor
    /// </param>
    /// <returns>
    ///   Retorna o valor do campo encontrado
    /// </returns>
    function PegarValor(const ACampo: string): string;
    /// <summary>
    ///   Pegar lista de dados, campo e valores
    ///   vindas da API
    /// </summary>
    /// <returns>
    ///   Retorna o valor do campo encontrado
    /// </returns>
    function PegarListaDados: TListaRetornoCampos;

  end;

implementation

end.

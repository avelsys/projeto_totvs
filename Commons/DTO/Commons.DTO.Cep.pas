unit Commons.DTO.Cep;

interface
type
  TCepDTO = class
  private
    Fcep: string;
    Flogradouro: string;
    Fcomplemento: string;
    Fbairro: string;
    Flocalidade: string;
    Fuf: string;
    Funidade: string;
    Festado: string;
    Fregiao: string;
    Fibge: string;
    Fgia: string;
    Fddd: string;
    Fsiafi: string;
    FServico: string;
  public
    property Servico: string      read FServico     write FServico;
    property cep: string          read Fcep         write Fcep;
    property logradouro: string   read Flogradouro  write Flogradouro;
    property complemento: string  read Fcomplemento write Fcomplemento;
    property bairro: string       read Fbairro      write Fbairro;
    property localidade: string   read Flocalidade  write Flocalidade;
    property uf: string           read Fuf          write Fuf;
    property unidade: string      read Funidade     write Funidade;
    property estado: string       read Festado      write Festado;
    property regiao: string       read Fregiao      write Fregiao;
    property ibge: string         read Fibge        write Fibge;
    property gia: string          read Fgia         write Fgia;
    property ddd: string          read Fddd         write Fddd;
    property siafi: string        read Fsiafi       write Fsiafi;
  end;

implementation

end.

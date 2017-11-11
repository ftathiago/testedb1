unit Exercicios.DataModule.Intf.DM;

interface

uses SysUtils, DB, DBClient;

type
  IDm = Interface
    procedure Abrir(const ID: Integer);
    function DataSet: TClientDataSet;
    function Pesquisa: TClientDataSet;
  end;

  IDmPessoa = Interface(IDm)
    procedure SalvarArquivo(const FileName: TFileName; Pessoa: TDataSet);
    function PrimeirasCemPessoas: TDataSet;
  end;

implementation

end.

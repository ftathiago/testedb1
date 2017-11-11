unit Exercicios.DMConexao;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr, DBClient, Provider,
  Exercicios.DataModule.Intf.DM;

type
  TDMConexao = class(TDataModule, IDm)
    AvaliacaoDB1: TSQLConnection;
    qryPesquisa: TSQLDataSet;
    dspPesquisa: TDataSetProvider;
    cdsPesquisa: TClientDataSet;
  private
    { Private declarations }
  protected
    procedure Abrir(const ID: Integer); virtual; abstract;
    function DataSet: TClientDataSet; virtual; abstract;
    function Pesquisa: TClientDataSet; virtual;
    function GenId(const NomeGenerator: string): Integer;
  public
    { Public declarations }

  end;

var
  DMConexao: TDMConexao;

implementation

{$R *.dfm}

{ TDMConexao }

function TDMConexao.GenId(const NomeGenerator: string): Integer;
var
  _qryGenerator: TSQLQuery;
begin
  _qryGenerator := TSQLQuery.Create(nil);
  _qryGenerator.SQLConnection := AvaliacaoDB1;
  try
    _qryGenerator.SQL.Text :=
      Format('select gen_id(%s,1) from rdb$database',[NomeGenerator]);
    _qryGenerator.Open;
    Result := _qryGenerator.Fields[0].AsInteger;
  finally
    _qryGenerator.Close;
    _qryGenerator.Free;
  end;
end;

function TDMConexao.Pesquisa: TClientDataSet;
begin
  Result := cdsPesquisa;
end;

end.


unit Exercicios.DataModule.Cidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Exercicios.DMConexao, DBXpress, FMTBcd, DBClient, Provider, DB,
  SqlExpr;

type
  TdmCidade = class(TDMConexao)
    cdsPesquisaCDCIDADE: TIntegerField;
    cdsPesquisaNMCIDADE: TStringField;
    cdsPesquisaUF: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCidade: TdmCidade;

implementation

{$R *.dfm}

end.

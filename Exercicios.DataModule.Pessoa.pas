unit Exercicios.DataModule.Pessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Exercicios.DMConexao, DBXpress, DB, SqlExpr, FMTBcd, Provider,
  DBClient, Exercicios.DataModule.Intf.DM;

type
  TdmPessoa = class(TDMConexao,IDmPessoa)
    PESSOA: TSQLDataSet;
    dspPessoa: TDataSetProvider;
    cdsPessoa: TClientDataSet;
    PESSOACDPESSOA: TIntegerField;
    PESSOANMPESSOA: TStringField;
    PESSOADELOGRADOURO: TStringField;
    PESSOADEBAIRRO: TStringField;
    PESSOACDCIDADE: TIntegerField;
    PESSOANMCIDADE: TStringField;
    cdsPessoaCDPESSOA: TIntegerField;
    cdsPessoaNMPESSOA: TStringField;
    cdsPessoaDELOGRADOURO: TStringField;
    cdsPessoaDEBAIRRO: TStringField;
    cdsPessoaCDCIDADE: TIntegerField;
    cdsPessoaNMCIDADE: TStringField;
    procedure dspPessoaBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure cdsPessoaAfterPost(DataSet: TDataSet);
    procedure cdsPessoaAfterInsert(DataSet: TDataSet);
    procedure qryPesquisaAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure SalvarArquivo(const FileName: TFileName; Pessoa: TDataSet);
    function PrimeirasCemPessoas: TDataSet;
    procedure Abrir(const ID: Integer); override;
    function DataSet: TClientDataSet; override;
  end;

var
  dmPessoa: TdmPessoa;

implementation

uses Classes.Utils;

{$R *.dfm}

{ TdmPessoa }


procedure TdmPessoa.Abrir(const ID: Integer);
begin
  inherited;
  cdsPessoa.Close;
  cdsPessoa.Params.ParamByName('CDPESSOA').AsInteger := ID;
  cdsPessoa.Open;
end;

function TdmPessoa.DataSet: TClientDataSet;
begin
  Result := cdsPessoa;
end;

procedure TdmPessoa.dspPessoaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  inherited;
  if UpdateKind = ukInsert then
  begin
    DeltaDS.Edit;
    DeltaDS.FieldByName('CDPESSOA').AsInteger :=
      GenId('GEN_PESSOA');
    DeltaDS.Post;      
  end;
end;

procedure TdmPessoa.cdsPessoaAfterPost(DataSet: TDataSet);
begin
  inherited;
  cdsPessoa.ApplyUpdates(0);
  cdsPessoa.Refresh;
end;

procedure TdmPessoa.cdsPessoaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsPessoaNMPESSOA.FocusControl;
end;

procedure TdmPessoa.SalvarArquivo(const FileName: TFileName; Pessoa: TDataSet);
var
  _arquivo: TStrings;
begin
  if Length(Trim(FileName)) = 0 then
    raise EFilerError.Create('Informe o nome do arquivo!');
  _arquivo := TStringList.Create;
  try
    Pessoa.First;
    while not Pessoa.Eof do
    begin
      _arquivo.Add(
        TStringUtils.StringFormatada(Pessoa.FieldByName('nmPessoa').AsString,50) +
        TStringUtils.StringFormatada(Pessoa.FieldByName('nmCidade').AsString,30) +
        TStringUtils.StringFormatada(Pessoa.FieldByName('UF').AsString,2));
      Pessoa.Next;
    end;
    _arquivo.SaveToFile(FileName);
  finally
    _arquivo.Free;
  end;
end;

function TdmPessoa.PrimeirasCemPessoas: TDataSet;
begin
  cdsPesquisa.Close;
  cdsPesquisa.CommandText :=
    'select first 100 PESSOA.nmPessoa ' +
    '     , CIDADE.nmCidade ' +
    '     , CIDADE.UF ' +
    'from PESSOA ' +
    '  join CIDADE on CIDADE.cdCidade = PESSOA.cdCidade';
  cdsPesquisa.Open;
  Result := cdsPesquisa;
end;

procedure TdmPessoa.qryPesquisaAfterOpen(DataSet: TDataSet);
var
  _field: TField;
begin
  inherited;
  _field := DataSet.FindField('CDPESSOA');
  if Assigned(_field) then
    _field.Visible := False;

  _field := DataSet.FindField('NMPESSOA');
  if Assigned(_field) then
  begin
      _field.DisplayLabel := 'Nome';
      _field.DisplayWidth := 23;
  end;

  _field := DataSet.FindField('DELOGRADOURO');
  if Assigned(_field) then
  begin
    _field.DisplayLabel := 'Logradouro';
    _field.DisplayWidth := 23;
  end;

  _field := DataSet.FindField('DEBAIRRO');
  if Assigned(_field) then
  begin
    _field.DisplayLabel := 'Bairro';
    _field.DisplayWidth := 23;
  end;

  _field := DataSet.FindField('NMCIDADE');
  if Assigned(_field) then
  begin
    _field.DisplayLabel := 'Cidade';
    _field.DisplayWidth := 23;
  end;
end;

end.

unit uDB1Data;

interface

uses
  SysUtils, Classes, DB, SqlExpr;

type
  TDB1Data = class(TSQLDataSet)
  private
    FListaCondicoes: TStrings;
    FListaCampos: TStrings;
    FListaTabelas: TStrings;
    procedure MontarSQL(Sender: TObject);
    procedure SetListaCampos(const Value: TStrings);
    procedure SetListaCondicoes(const Value: TStrings);
    procedure SetListaTabelas(const Value: TStrings);
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;
  published
    { Published declarations }
    property ListaCampos: TStrings read FListaCampos write SetListaCampos;
    property ListaTabelas: TStrings read FListaTabelas write SetListaTabelas;
    property ListaCondicoes: TStrings read FListaCondicoes write SetListaCondicoes;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('DB1 Avaliação', [TDB1Data]);
end;

{ TDB1Data }

procedure TDB1Data.AfterConstruction;
begin
  inherited;
  FListaCondicoes := TStringList.Create;
  FListaCampos := TStringList.Create;
  FListaTabelas := TStringList.Create;

  TStringList(FListaCondicoes).OnChange := MontarSQL;
  TStringList(FListaCampos).OnChange := MontarSQL;
  TStringList(FListaTabelas).OnChange := MontarSQL;
end;

procedure TDB1Data.BeforeDestruction;
begin
  inherited;
  FListaCondicoes.Free;
  FListaCampos.Free;
  FListaTabelas.Free;
end;

procedure TDB1Data.MontarSQL(Sender: TObject);
begin
  CommandText := Format(
    'select %s from %s ',
    [FListaCampos.Text,FListaTabelas.Text]);
  //Não obrigatório ter um where.
  if Length(Trim(FListaCondicoes.Text)) > 0 then
    CommandText := Format('%s where %s',[CommandText,FListaCondicoes.Text]);
end;

procedure TDB1Data.SetListaCampos(const Value: TStrings);
begin
  FListaCampos.Assign(Value);
end;

procedure TDB1Data.SetListaCondicoes(const Value: TStrings);
begin
  FListaCondicoes.Assign(Value);
end;

procedure TDB1Data.SetListaTabelas(const Value: TStrings);
begin
  FListaTabelas.Assign(Value);
end;

end.

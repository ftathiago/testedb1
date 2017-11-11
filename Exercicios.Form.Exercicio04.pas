unit Exercicios.Form.Exercicio04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Exercicios.Form.Modelo, FMTBcd, ActnList, StdCtrls, DB, SqlExpr,
  uDB1Data, Grids, DBGrids, DBClient, Provider;

type
  TfrmExercicio04 = class(TfrmModelo)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    memCampos: TMemo;
    memTabelas: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    memCondicoes: TMemo;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    dtsTeste: TDataSource;
    DB1Data: TDB1Data;
    btnConsultar: TButton;
    actConsultar: TAction;
    dspDB1Data: TDataSetProvider;
    cdsDB1Data: TClientDataSet;
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure actConsultarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure BeforeDestruction; override;
    { Public declarations }

  end;

var
  frmExercicio04: TfrmExercicio04;

implementation

uses Exercicios.DMConexao;

{$R *.dfm}

procedure TfrmExercicio04.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  actConsultar.Enabled :=
    (Length(Trim(memCampos.Text)) > 0)
    and (Length(Trim(memTabelas.Text)) > 0);
end;

procedure TfrmExercicio04.actConsultarExecute(Sender: TObject);
begin
  inherited;
  try
    cdsDB1Data.Close;
    DB1Data.ListaCampos.Clear;
    DB1Data.ListaTabelas.Clear;
    DB1Data.ListaCondicoes.Clear;
    DB1Data.ListaCampos.AddStrings(memCampos.Lines);
    DB1Data.ListaTabelas.AddStrings(memTabelas.Lines);
    DB1Data.ListaCondicoes.AddStrings(memCondicoes.Lines);
    cdsDB1Data.Open;
  except
    on E: Exception do
    begin
      E.Message :=
        E.Message + #$D#$A + #$D#$A +
        'Revise as informações de Campos, Tabela e Condição e então tente novamente';
      raise;
    end;
  end;
end;

procedure TfrmExercicio04.BeforeDestruction;
begin
  inherited;
  frmExercicio04 := nil;
end;

end.

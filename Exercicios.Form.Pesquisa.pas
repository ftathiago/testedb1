unit Exercicios.Form.Pesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, Exercicios.DataModule.Intf.Dm,
  ActnList;

type
  TfrmPesquisa = class(TForm)
    dtsPesquisa: TDataSource;
    dbgPesquisa: TDBGrid;
    pnlControles: TPanel;
    lblDescricao: TLabel;
    edtPesquisa: TEdit;
    Button1: TButton;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    ActionList: TActionList;
    actPesquisar: TAction;
    actSelecionar: TAction;
    actCancelar: TAction;
    procedure actSelecionarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure dbgPesquisaDblClick(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
    FDataModulo: IDm;
    procedure SetDataModulo(const Value: IDm);
    procedure AtribuirParametros;
  public
    { Public declarations }
    property DataModulo: IDm read FDataModulo write SetDataModulo;
    procedure BeforeDestruction; override;

  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

{ TfrmPesquisa }

procedure TfrmPesquisa.SetDataModulo(const Value: IDm);
begin
  FDataModulo := Value;
  dtsPesquisa.DataSet := FDataModulo.Pesquisa;


  // A consulta parametrizada só estará disponível se tiver parâmetro no sql de
  // pesquisa
  pnlControles.Visible := FDataModulo.Pesquisa.Params.Count > 0;

  if (FDataModulo.Pesquisa.Params.Count > 0) then
  begin
    // Automatiza o caption da pesquisa.
    if Assigned(FDataModulo.Pesquisa.FindField(FDataModulo.Pesquisa.Params[0].Name)) then
      lblDescricao.Caption :=
        FDataModulo.Pesquisa.FindField(FDataModulo.Pesquisa.Params[0].Name).DisplayName +': ';
  end
  else
  begin
    FDataModulo.Pesquisa.Open;
  end;
end;

procedure TfrmPesquisa.actSelecionarExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPesquisa.actCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPesquisa.actPesquisarExecute(Sender: TObject);
begin
  DataModulo.Pesquisa.Close;
  AtribuirParametros;
  DataModulo.Pesquisa.Open;
end;

procedure TfrmPesquisa.AtribuirParametros;
begin
  // Poderia ser implemntada uma inteligência que fizesse o cruzamento correto
  // dos valores da pesquisa com os parâmetros do Dataset.
  // OU AINDA, montar a própria pesquisa, implementando filtros.
  if DataModulo.Pesquisa.Params.Count > 0 then
    DataModulo.Pesquisa.Params[0].AsString := edtPesquisa.Text;
end;

procedure TfrmPesquisa.dbgPesquisaDblClick(Sender: TObject);
begin
  actSelecionar.Execute;
end;

procedure TfrmPesquisa.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  actPesquisar.Enabled := Length(edtPesquisa.Text) > 0;
  actSelecionar.Enabled := not DataModulo.Pesquisa.IsEmpty;
end;

procedure TfrmPesquisa.BeforeDestruction;
begin
  inherited;
  DataModulo.Pesquisa.Close;
end;

end.

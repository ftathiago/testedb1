unit Exercicios.Form.Exercicio03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Exercicios.Form.Modelo, StdCtrls, ActnList, ExtCtrls, Buttons,
  Mask, DBCtrls, DB, DBActns, Exercicios.DataModule.Intf.DM;

type
  TfrmExercicio03 = class(TfrmModelo)
    GroupBox1: TGroupBox;
    dtsDados: TDataSource;
    Label1: TLabel;
    NMPESSOA: TDBEdit;
    Label2: TLabel;
    DELOGRADOURO: TDBEdit;
    Label3: TLabel;
    DEBAIRRO: TDBEdit;
    CDCIDADE: TDBEdit;
    Label5: TLabel;
    NMCIDADE: TDBEdit;
    BitBtn1: TBitBtn;
    pnlControles: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    actPesquisarCidade: TAction;
    actNovo: TDataSetInsert;
    actApagar: TDataSetDelete;
    actEditar: TDataSetEdit;
    actSalvar: TDataSetPost;
    actPesquisar: TAction;
    actSair: TAction;
    procedure actSairExecute(Sender: TObject);
    procedure actPesquisarCidadeExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure actPesquisarExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FdmPessoa: IDm;
    FdmCidade: IDm;
    procedure SetdmPessoa(const Value: IDm);
    procedure SetdmCidade(const Value: IDm);
    { Private declarations }
  public
    { Public declarations }
    property dmPessoa: IDm read FdmPessoa write SetdmPessoa;
    property dmCidade: IDm read FdmCidade write SetdmCidade;
    procedure BeforeDestruction; override;
  end;

var
  frmExercicio03: TfrmExercicio03;

implementation

uses Exercicios.Form.Pesquisa;



{$R *.dfm}

procedure TfrmExercicio03.actSairExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmExercicio03.SetdmCidade(const Value: IDm);
begin
  FdmCidade := Value;
end;

procedure TfrmExercicio03.SetdmPessoa(const Value: IDm);
begin
  FdmPessoa := Value;
  dtsDados.DataSet := FdmPessoa.DataSet;
  FdmPessoa.Abrir(-1);
end;

procedure TfrmExercicio03.actPesquisarCidadeExecute(Sender: TObject);
begin
  inherited;
  frmPesquisa := TfrmPesquisa.Create(nil);
  try
    frmPesquisa.DataModulo := dmCidade;
    if frmPesquisa.ShowModal = mrOk then
    begin
      dmPessoa.DataSet.FieldByName('CDCIDADE').AsInteger :=
        dmCidade.Pesquisa.FieldByName('CDCIDADE').AsInteger;
      dmPessoa.DataSet.FieldByName('NMCIDADE').AsString :=
        dmCidade.Pesquisa.FieldByName('NMCIDADE').AsString;
    end;
  finally
    frmPesquisa.Release;
    frmPesquisa := nil;
  end;
end;

procedure TfrmExercicio03.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  actPesquisarCidade.Enabled := dtsDados.State in [dsInsert,dsEdit];
  actPesquisar.Enabled := not (dtsDados.State in [dsInsert,dsEdit]);
end;

procedure TfrmExercicio03.actPesquisarExecute(Sender: TObject);
begin
  inherited;
  frmPesquisa := TfrmPesquisa.Create(nil);
  try
    frmPesquisa.DataModulo := dmPessoa;
    if frmPesquisa.ShowModal = mrOk then
    begin
      dmPessoa.Abrir(dmPessoa.Pesquisa.FieldByName('CDPESSOA').AsInteger);
    end;
  finally
    frmPesquisa.Release;
    frmPesquisa := nil;
  end;
end;

procedure TfrmExercicio03.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if dmPessoa.DataSet.State in [dsInsert,dsEdit] then
  begin
    case MessageDlg(
      'Você tem uma alteração em andamento. '+
      'Deseja cancelar antes de sair?', mtConfirmation, [mbYes,mbNo], 0)
    of
      mrOk:
        begin
          CanClose := True;
          dmPessoa.DataSet.Close;
        end;
      mrCancel: CanClose := False;
    end;
  end;
end;

procedure TfrmExercicio03.BeforeDestruction;
begin
  inherited;
  dmPessoa.DataSet.Close;
  frmExercicio03 := nil;
end;

end.

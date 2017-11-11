unit Exercicios.Form.Exercicio05;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Exercicios.Form.Modelo, ExtCtrls, ActnList, StdCtrls,
  Exercicios.DataModule.Intf.DM;

type
  TfrmExercicio05 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    edtLocalDoArquivo: TEdit;
    Label1: TLabel;
    ActionList: TActionList;
    actSalvar: TAction;
    actSair: TAction;
    actSelecionar: TAction;
    SaveDialog: TSaveDialog;
    procedure actSairExecute(Sender: TObject);
    procedure actSelecionarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  private
    FdmPessoa: IDmPessoa;
    procedure SetdmPessoa(const Value: IDmPessoa);
    { Private declarations }
  public
    { Public declarations }
    property dmPessoa: IDmPessoa read FdmPessoa write SetdmPessoa;
  end;

var
  frmExercicio05: TfrmExercicio05;

implementation


{$R *.dfm}

procedure TfrmExercicio05.actSairExecute(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmExercicio05.actSelecionarExecute(Sender: TObject);
begin
  inherited;
  if SaveDialog.Execute then
  begin
    edtLocalDoArquivo.Text := SaveDialog.FileName;
  end;
end;

procedure TfrmExercicio05.SetdmPessoa(const Value: IDmPessoa);
begin
  FdmPessoa := Value;
end;

procedure TfrmExercicio05.actSalvarExecute(Sender: TObject);
begin
  inherited;
  dmPessoa.SalvarArquivo(
    edtLocalDoArquivo.Text,
    dmPessoa.PrimeirasCemPessoas);
  ShowMessage('Arquivos salvos com sucesso!');
  ModalResult := mrOk;
end;

procedure TfrmExercicio05.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  actSalvar.Enabled := Length(Trim(edtLocalDoArquivo.Text)) > 0;
end;

end.

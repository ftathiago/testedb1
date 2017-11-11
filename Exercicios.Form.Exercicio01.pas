{******************************************************************************

Estou partindo do princípio que Array Dinâmico não é o mesmo que uma Lista ou
uma Lista encadeada. Justamente por isso não utilizei o TStrings e seus
descendentes. É digno de nota que a implementação com TStrings seria mais clara
e menos verbosa do que com arrays dinâmicos

*******************************************************************************}

unit Exercicios.Form.Exercicio01;

interface

uses
Classes.Utils,   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Buttons, Exercicios.Form.Modelo;

type
  TfrmExercicio01 = class(TfrmModelo)
    grpInserirNomes: TGroupBox;
    Label1: TLabel;
    edtNome: TEdit;
    grpOperacoes: TGroupBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    grpListaDeNomes: TGroupBox;
    lbxListaNomes: TListBox;
    SpeedButton6: TSpeedButton;
    actInserirNome: TAction;
    actRemoverPrimeiroNome: TAction;
    actRemoverUltimoNome: TAction;
    actContarNomes: TAction;
    actSair: TAction;
    actExibirNomes: TAction;
    BitBtn1: TBitBtn;
    procedure actInserirNomeExecute(Sender: TObject);
    procedure actRemoverPrimeiroNomeExecute(Sender: TObject);
    procedure actRemoverUltimoNomeExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actContarNomesExecute(Sender: TObject);
    procedure actExibirNomesExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
    FNomes: array of String;
  public
    procedure BeforeDestruction; override;
    { Public declarations }

  end;

var
  frmExercicio01: TfrmExercicio01;

implementation


{$R *.dfm}

{ TFmArrayDinamico }

procedure TfrmExercicio01.BeforeDestruction;
begin
  inherited;
  Finalize(FNomes);
  frmExercicio01 := nil;
end;

procedure TfrmExercicio01.actInserirNomeExecute(Sender: TObject);
var
  _index: Integer;
begin
  _index := Length(FNomes);
  SetLength(FNomes,_index + 1);
  FNomes[_index] := edtNome.Text;

  edtNome.SelectAll;
  if edtNome.CanFocus then
    edtNome.SetFocus;
end;

procedure TfrmExercicio01.actRemoverPrimeiroNomeExecute(Sender: TObject);
begin
  if Length(Trim(FNomes[0])) > 0 then
    FNomes[0] := ''
  else
    ShowMessage('O primeiro item da lista já foi removido!');
end;

procedure TfrmExercicio01.actRemoverUltimoNomeExecute(Sender: TObject);
var
  _ultimoIndex: Integer;
begin
  _ultimoIndex := Length(FNomes) -1;

  if Length(Trim(FNomes[_ultimoIndex])) >0 then
    FNomes[_ultimoIndex] := ''
  else
    ShowMessage('O último item da lista já foi removido!')
end;

procedure TfrmExercicio01.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmExercicio01.actContarNomesExecute(Sender: TObject);
var
  i, qtd: Integer;
begin
  qtd := 0;
  for i := 0 to Length(FNomes) -1 do
    if Length(Trim(FNomes[i])) > 0 then
      qtd := qtd +1;
  ShowMessage(Format('%d nomes inseridos', [qtd]));
end;

procedure TfrmExercicio01.actExibirNomesExecute(Sender: TObject);
var
  _nomesOrdenados: array of String;
  _novoIndex: Integer;
  i:Integer;
begin
  // Inicializa um array local para não perder a ordem de entrada original
  _novoIndex := 0;
  try
    for i := 0 to Length(FNomes) -1 do
    begin
      if Length(Trim(FNomes[i])) > 0 then
      begin
        _novoIndex := _novoIndex + 1;
        SetLength(_nomesOrdenados,_novoIndex);
        _nomesOrdenados[_novoIndex -1] := FNomes[i];
      end;
    end;

    // Ordena o novo array
    TStringUtils.heapSort(_nomesOrdenados);

    lbxListaNomes.Items.Clear;
    for i := 0 to Length(_nomesOrdenados) -1 do
      lbxListaNomes.Items.Add(_nomesOrdenados[i]);
  finally
    Finalize(_nomesOrdenados);
  end;
end;

procedure TfrmExercicio01.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  actRemoverPrimeiroNome.Enabled := Length(FNomes)> 0;

  actRemoverUltimoNome.Enabled :=
    actRemoverPrimeiroNome.Enabled;
  actContarNomes.Enabled :=
    actRemoverPrimeiroNome.Enabled;
  actExibirNomes.Enabled :=
    actRemoverPrimeiroNome.Enabled;
end;

end.

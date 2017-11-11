unit Exercicios.Form.Menu;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList, AppEvnts;

type
  TfrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    OpenDialog: TOpenDialog;
    StatusBar: TStatusBar;
    ActionList1: TActionList;
    ImageList1: TImageList;
    actExercicio01: TAction;
    Exerccios1: TMenuItem;
    Exerccio1Cadastrodelistadenomes1: TMenuItem;
    actExercicio02: TAction;
    Exerccio2Classesdeconversodetexto1: TMenuItem;
    actExercicio03: TAction;
    Exerccio03Teladecadastro1: TMenuItem;
    actExercicio04: TAction;
    Exerccio04CriaodeComponentes1: TMenuItem;
    actExercicio05: TAction;
    Exerccio05Criaodearquivos1: TMenuItem;
    actExercicio06: TAction;
    Exerccio06Utilizaodebibliotecasdinmicas1: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    actExercicio07: TAction;
    Exerccio07Processosconcorrentes1: TMenuItem;
    procedure actExercicio01Execute(Sender: TObject);
    procedure actExercicio02Execute(Sender: TObject);
    procedure actExercicio03Execute(Sender: TObject);
    procedure actExercicio04Execute(Sender: TObject);
    procedure actExercicio05Execute(Sender: TObject);
    procedure actExercicio06Execute(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure actExercicio07Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses Exercicios.DataModule.Pessoa, Exercicios.DataModule.Cidade,
  Exercicios.Form.Exercicio01, Exercicios.Form.Exercicio02,
  Exercicios.Form.Exercicio03, Exercicios.Form.Exercicio04,
  Exercicios.Form.Exercicio05, Exercicios.Form.Exercicio06,
  Exercicios.Form.Exercicio07;

{$R *.dfm}

procedure TfrmMenu.actExercicio01Execute(Sender: TObject);
begin
  if not Assigned(frmExercicio01) then
    frmExercicio01 := TfrmExercicio01.Create(Self);
  frmExercicio01.Show
end;

procedure TfrmMenu.actExercicio02Execute(Sender: TObject);
begin
  if not Assigned(frmExercicio02) then
    frmExercicio02 := TfrmExercicio02.Create(Self);
  frmExercicio02.Show;
end;

procedure TfrmMenu.actExercicio03Execute(Sender: TObject);
begin
  if not Assigned(frmExercicio03) then
  begin
    frmExercicio03 := TfrmExercicio03.Create(Nil);
    frmExercicio03.dmPessoa := dmPessoa;
    frmExercicio03.dmCidade := dmCidade;
  end;
  frmExercicio03.Show;
end;

procedure TfrmMenu.actExercicio04Execute(Sender: TObject);
begin
  if not Assigned(frmExercicio04) then
    frmExercicio04 := TfrmExercicio04.Create(nil);
  frmExercicio04.Show;
end;

procedure TfrmMenu.actExercicio05Execute(Sender: TObject);
begin
  frmExercicio05 := TfrmExercicio05.Create(nil);
  try
    frmExercicio05.dmPessoa := dmPessoa;
    frmExercicio05.ShowModal;
  finally
    frmExercicio05.Release;
    frmExercicio05 := nil;
  end;
end;

procedure TfrmMenu.actExercicio06Execute(Sender: TObject);
begin
  if not Assigned(frmExercicio06) then
    frmExercicio06 := TfrmExercicio06.Create(nil);
  frmExercicio06.Show;
end;

procedure TfrmMenu.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  MessageDlg(
    'Ocorreu um erro ao executar a sua ação:'+ #$D#$A + E.Message,
    mtError, [mbOk], 0);
end;

procedure TfrmMenu.actExercicio07Execute(Sender: TObject);
begin
  frmExercicio07 := TfrmExercicio07.Create(nil);
  try
    frmExercicio07.ShowModal;
  finally
    frmExercicio07.Release;
    frmExercicio07 := nil;
  end;
end;

end.

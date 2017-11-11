unit Exercicios.Form.Exercicio07;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Exercicios.Form.Modelo, ActnList, ComCtrls, StdCtrls, ExtCtrls;

type
  IProgressController = Interface(IInterface)
    procedure setPosicao(const Valor: Integer);
    function getPosicao: Integer;
    function getMaximo: Integer;
    procedure setMaximo(const Valor: Integer);
  end;

  // Classe responsável por atualizar o ProgressBar
  // Não preciso dar Free nela por conta da herança de TInterfacedObject
  TProgressController = class(TInterfacedObject, IProgressController)
  private
    FProgress: TProgressBar;
  public
    class function New(Progress: TProgressBar): IProgressController;
    constructor Create(Progress: TProgressBar);
    procedure setPosicao(const Valor: Integer);
    function getPosicao: Integer;
    function getMaximo: Integer;
    procedure setMaximo(const Valor: Integer);
  end;

  TAssincProgress = class(TThread)
  private
    FProgressController: IProgressController;
    FSleep: Integer;
    procedure AtualizarProgress;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean;
      ProgressController: IProgressController); reintroduce;
    procedure setSleep(const Valor: Integer);
  end;

  TfrmExercicio07 = class(TForm)
    GroupBox1: TGroupBox;
    progThread1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    progThread2: TProgressBar;
    Label3: TLabel;
    edtSleep1: TEdit;
    Label4: TLabel;
    edtSleep2: TEdit;
    pnlControles: TPanel;
    Button1: TButton;
    btnSair: TButton;
    ActionList: TActionList;
    actExecutar: TAction;
    actSair: TAction;
    procedure actExecutarExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
  private
    { Private declarations }
    FBarController1: IProgressController;
    FBarController2: IProgressController;
    procedure ValidarEdtSleep(AedtSleep: TEdit);
  public
    procedure AfterConstruction; override;

    { Public declarations }

  end;

var
  frmExercicio07: TfrmExercicio07;

implementation

uses Classes.Utils;

{$R *.dfm}

{ TProgressController }

constructor TProgressController.Create(Progress: TProgressBar);
begin
  FProgress := Progress;
end;

function TProgressController.getMaximo: Integer;
begin
  Result := FProgress.Max;
end;

function TProgressController.getPosicao: Integer;
begin
  Result := FProgress.Position
end;

class function TProgressController.New(
  Progress: TProgressBar): IProgressController;
begin
  Result := Create(Progress);
end;

procedure TProgressController.setMaximo(const Valor: Integer);
begin
  FProgress.Max := Valor;
end;

procedure TProgressController.setPosicao(const Valor: Integer);
begin
  FProgress.Position := Valor;
end;

{ TAssincProgress }

procedure TAssincProgress.AtualizarProgress;
begin
  FProgressController.setPosicao(FProgressController.getPosicao +1);
end;

constructor TAssincProgress.Create(CreateSuspended: Boolean;
  ProgressController: IProgressController);
begin
  inherited Create(CreateSuspended);
  FProgressController := ProgressController;
  FreeOnTerminate := False;
  FSleep := 0;
end;

procedure TAssincProgress.Execute;
begin
  while FProgressController.getPosicao < FProgressController.getMaximo do
  begin
    Synchronize(AtualizarProgress);
    Sleep(FSleep);
  end;
end;

procedure TfrmExercicio07.actExecutarExecute(Sender: TObject);
var
  _thread1: TAssincProgress;
  _thread2: TAssincProgress;
  _sleep1: Integer;
  _sleep2: Integer;
begin
  progThread1.Position := 0;
  progThread2.Position := 0;

  ValidarEdtSleep(edtSleep1);
  ValidarEdtSleep(edtSleep2);

  _sleep1 := StrToInt(edtSleep1.Text);
  _sleep2 := StrToInt(edtSleep2.Text);

  _thread1 := TAssincProgress.Create(True,FBarController1);
  _thread2 := TAssincProgress.Create(True,FBarController2);

  _thread1.setSleep(_sleep1);
  _thread2.setSleep(_sleep2);

  _thread1.FreeOnTerminate := True;
  _thread1.FreeOnTerminate := True;

  _thread1.Resume;
  _thread2.Resume;
end;

procedure TfrmExercicio07.AfterConstruction;
begin
  inherited;
  FBarController1 := TProgressController.New(progThread1);
  FBarController2 := TProgressController.New(progThread2);
end;

procedure TAssincProgress.setSleep(const Valor: Integer);
begin
  FSleep := Valor;
end;

procedure TfrmExercicio07.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmExercicio07.ValidarEdtSleep(AedtSleep: TEdit);
begin
  if (Length(Trim(AedtSleep.Text)) = 0) then
  begin
    AedtSleep.SetFocus;
    raise EInvalidCast.Create('Os valores informados no campo Sleep estão vazios!')
  end
  else if (not TStringUtils.ehApenasNumerico(AedtSleep.Text)) then
  begin
    AedtSleep.SetFocus;
    raise EInvalidCast.Create('Os valores informados no campo Sleep devem ser apenas numéricos!');
  end;
end;

end.

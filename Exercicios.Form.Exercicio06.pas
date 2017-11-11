unit Exercicios.Form.Exercicio06;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Exercicios.Form.Modelo, StdCtrls, ExtCtrls, ActnList;

type
  TfrmExercicio06 = class(TfrmModelo)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtLado: TEdit;
    rgpCalculoQuadrado: TRadioGroup;
    Button1: TButton;
    Label2: TLabel;
    edtResultadoQuadrado: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtRaio: TEdit;
    rgpCalculoCirculo: TRadioGroup;
    Button2: TButton;
    edtResultadoCirculo: TEdit;
    actCalcularQuadrado: TAction;
    actCalcularCirculo: TAction;
    procedure actCalcularQuadradoExecute(Sender: TObject);
    procedure actCalcularCirculoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BeforeDestruction; override;
  end;

var
  frmExercicio06: TfrmExercicio06;

implementation

uses Classes.Calculo, Classes.Utils;

{$R *.dfm}

procedure TfrmExercicio06.actCalcularQuadradoExecute(Sender: TObject);
var
  _calculo: ICalculo;
  _lado: Double;
  _resultado: Double;
begin
  inherited;
  if not TStringUtils.ehApenasNumerico(edtLado.Text) then
  begin
    edtLado.SetFocus;
    raise EInvalidCast.CreateFmt('O valor informado [%s] não é um número válido!',[edtLado.Text]);
  end;

  _lado := StrToFloat(edtLado.Text);
  _calculo := TCalculoQuadrado.Create(_lado, _lado);
  _resultado := 0;
  case rgpCalculoQuadrado.ItemIndex of
    0: // Área
      _resultado := _calculo.CalcularArea;
    1:// Perímetro
      _resultado := _calculo.CalcularPerimetro;
    else
      raise Exception.Create('Selecione um tipo de cálculo!');
  end;
  edtResultadoQuadrado.Text := FloatToStr(_resultado);
end;

procedure TfrmExercicio06.actCalcularCirculoExecute(Sender: TObject);
var
  _calculo: ICalculo;
  _raio: Double;
  _resultado: Double;
begin
  inherited;
  if not TStringUtils.ehApenasNumerico(edtRaio.Text) then
  begin
    edtRaio.SetFocus;
    raise EInvalidCast.CreateFmt('O valor informado [%s] não é um número válido!',[edtRaio.Text]);
  end;

  _raio := StrToFloat(edtRaio.Text);
  _calculo := TCalculoCirculo.Create(_raio);
  _resultado := 0;
  case rgpCalculoCirculo.ItemIndex of
    0: // Área
      _resultado := _calculo.CalcularArea;
    1:// Perímetro
      _resultado := _calculo.CalcularPerimetro;
    else
      raise Exception.Create('Selecione um tipo de cálculo!');
  end;
  edtResultadoCirculo.Text := FloatToStr(_resultado);
end;

procedure TfrmExercicio06.BeforeDestruction;
begin
  inherited;
  frmExercicio06 := nil;
end;

end.

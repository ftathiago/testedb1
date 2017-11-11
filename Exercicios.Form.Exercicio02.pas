unit Exercicios.Form.Exercicio02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Exercicios.Form.Modelo, Buttons, ActnList;

type
  TfrmExercicio02 = class(TfrmModelo)
    Label1: TLabel;
    edtTextoOriginal: TMemo;
    rgpTipoConversao: TRadioGroup;
    Label2: TLabel;
    edtQtdLetras: TEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    edtTextoConvertido: TMemo;
    actConverter: TAction;
    procedure actConverterExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure BeforeDestruction; override;
    { Public declarations }

  end;

var
  frmExercicio02: TfrmExercicio02;

implementation

uses Classes.Conversao.ConverteTexto,
  Classes.Conversao.ConverteTextoFactory;

{$R *.dfm}

procedure TfrmExercicio02.actConverterExecute(Sender: TObject);
var
  _converterTexto: TConverteTexto;
begin
  inherited;
  _converterTexto :=
    TConversaoFactory.getConverteTexto(TTipoConversao(rgpTipoConversao.ItemIndex));
  _converterTexto.Texto := edtTextoOriginal.Text;
  edtTextoConvertido.Text := _converterTexto.Converter;
  edtQtdLetras.Text := IntToStr(_converterTexto.getTamanhoTexto);
end;

procedure TfrmExercicio02.BeforeDestruction;
begin
  inherited;
  frmExercicio02 := nil;
end;

end.

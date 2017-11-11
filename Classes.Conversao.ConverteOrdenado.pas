unit Classes.Conversao.ConverteOrdenado;

interface

uses Classes.Conversao.ConverteTexto;

type
  TConverteOrdenado = class(TConverteTexto)
  private
    function RetirarEspacosEmBranco(const ATexto: string): string;
  protected
    function getTextoConvertido: String;override;
  end;

implementation

uses SysUtils, Classes.Utils;

{ TConverteOrdenado }

function TConverteOrdenado.getTextoConvertido: String;
var
  _textoOrdenado: String;
begin
  _textoOrdenado := Trim(Texto);
  _textoOrdenado := RetirarEspacosEmBranco(_textoOrdenado);
  TStringUtils.selectionSort(_textoOrdenado);
  Result := _textoOrdenado;
end;

function TConverteOrdenado.RetirarEspacosEmBranco(
  const ATexto: string): string;
begin
  Result := StringReplace(ATexto,' ','',[rfReplaceAll]);
end;

end.

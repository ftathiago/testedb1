unit Classes.Conversao.ConverteInvertido;

interface

uses Classes.Conversao.ConverteTexto;

type
  TConverteInvertido = class(TConverteTexto)
  protected
    function getTextoConvertido: String; override;
  end;

implementation

uses StrUtils;

{ TConverteInvertido }

function TConverteInvertido.getTextoConvertido: String;
begin
  Result := ReverseString(Texto);
end;

end.

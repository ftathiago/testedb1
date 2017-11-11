unit Classes.Conversao.ConvertePrimeiraMaiuscula;

interface

uses Classes.Conversao.ConverteTexto;

type
  TConverterPrimeiraMaiuscula = class(TConverteTexto)
  protected
    function getTextoConvertido: String; override;
  end;

implementation

uses SysUtils;

{ TConverterPrimeiraMaiuscula }

function TConverterPrimeiraMaiuscula.getTextoConvertido: String;
var
  _primeiraMaiuscula: string;
  i: Integer;
begin
  /// Poderia fazer outras verifica��es, tomando o Pos(' ', Texto) como refer�ncia.
  /// Mas como uma entrada com dois espa�os em branco � v�lida, melhor testar
  /// A string por completo.
  for i := 1 to Length(Trim(Texto)) do
  begin
    if (Texto[i - 1] = ' ') or (i = 1) then
      _primeiraMaiuscula := _primeiraMaiuscula + UpperCase(Texto[i])
    else
      _primeiraMaiuscula := _primeiraMaiuscula + Texto[i];
  end;

  Result := _primeiraMaiuscula;
end;

end.

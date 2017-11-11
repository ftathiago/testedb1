unit Classes.Conversao.ConverteTextoFactory;

interface

uses Classes.Conversao.ConverteTexto;

type

  TTipoConversao = (tcInvertido, tcPrimeiraMaiuscula, tcOrdemAlfabetica);

  TConversaoFactory = class
    class function getConverteTexto(TipoConversao: TTipoConversao):TConverteTexto;
  end;

implementation

uses SysUtils, Classes.Conversao.ConverteInvertido,
  Classes.Conversao.ConvertePrimeiraMaiuscula,
  Classes.Conversao.ConverteOrdenado;

{ TConversaoFactory }

class function TConversaoFactory.getConverteTexto(
  TipoConversao: TTipoConversao): TConverteTexto;
begin
  case TipoConversao of
    tcInvertido: Result := TConverteInvertido.Create;
    tcPrimeiraMaiuscula: Result := TConverterPrimeiraMaiuscula.Create;
    tcOrdemAlfabetica: Result := TConverteOrdenado.Create;
  else
    raise EInvalidCast.Create('Tipo de conversao informado inválido!');
  end;

end;

end.

unit Classes.Conversao.ConverteTexto;

interface

uses Classes.Conversao;

type
  TConverteTexto = class(TConversao)
  private
    FTexto: String;
    procedure SetTexto(const Value: String);
  protected
    function getTextoConvertido: string; virtual; abstract;
  public
    property Texto: String read FTexto write SetTexto;
    function getTamanhoTexto: Integer;
    function Converter: String; override;
  end;

implementation

uses SysUtils, Classes, Classes.Utils;

{ TConverteTexto }

function TConverteTexto.Converter: String;
begin
  if TStringUtils.ehApenasNumerico(Trim(Texto)) then
    Result := ''
  else
    Result := getTextoConvertido;
end;

function TConverteTexto.getTamanhoTexto: Integer;
begin
  Result := Length(Texto);
end;

procedure TConverteTexto.SetTexto(const Value: String);
begin
  if Length(Trim(Value)) = 0 then
    raise EInvalidOperation.Create('Não é permitido texto vazio!');
  FTexto := Value;
end;

end.

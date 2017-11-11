unit Classes.Utils;

interface
type
  TStringUtils = class
    class function ehNumerico(AChar: Char):boolean;
    class function ehApenasNumerico(Texto: string):boolean;
    class function StringFormatada(const Texto: string; const Tamanho: Integer):string;
    /// Escolhi essa implementação por ter melhor performance em vetor
    /// já ordenados
    class procedure selectionSort(var ATexto: string);
    class procedure heapSort(var ATexto: array of String);
  end;

implementation

uses SysUtils;

{ TStringUtils }

class function TStringUtils.ehApenasNumerico(Texto: string): boolean;
var
  i: Integer;
begin
  // Se a string está vazia, não é numérico
  Result := Length(Trim(Texto)) > 0;
  for i := 1 to Length(Texto) do
    if not ehNumerico(Texto[i]) then
    begin
      Result := False;
      Break;
    end;
end;

class function TStringUtils.ehNumerico(AChar: Char): boolean;
var
  _out: Integer;
begin
  Result := TryStrToInt(AChar,_out);
end;

class procedure TStringUtils.heapSort(var ATexto: array of String);
	procedure organizaNo(var ATextoint; i, tam: Integer);
  var
    posMaior, esq, dir: Integer;
    tmp: string;
  begin
    posMaior := i;
		esq := 2 * i + 1;
		dir := 2 * i + 2;

		if (esq <= tam) then
    begin
			if ((dir <= tam) and (AnsiCompareText(ATexto[esq], ATexto[dir]) < 0)) then
				posMaior := dir
      else
  			posMaior := esq;
		end;

		if ((posMaior <> i) and (AnsiCompareText(ATexto[posMaior], ATexto[i]) > 0))  then
    begin
			tmp := ATexto[i];
			ATexto[i] := ATexto[posMaior];
			ATexto[posMaior] := tmp;
		end;
	end;

	procedure heap(var ATexto: array of String; tam: Integer);
  var
    i:Integer;
  begin
		for i := ((tam - 1) div 2) downto 0 do
    begin
			organizaNo(ATexto, i, tam);
			tam := tam-1;
    end;
  end;
var
  i, tam: integer;
  tmp: string;
begin
  tam := Length(ATexto);
  for i := tam - 1  downto 0 do
  begin
    heap(ATexto, i);
    if (ATexto[0] > ATexto[i]) then
    begin
      tmp := ATexto[0];
      ATexto[0] := ATexto[i];
      ATexto[i] := tmp;
    end;
  end;
end;

class procedure TStringUtils.selectionSort(var ATexto: string);
var
  min, j, i: Integer;
  aux: char;
begin
  for i := 1 to Length(ATexto) - 1 do
  begin
    min := i;
    for j := i + 1 to Length(ATexto) do
    begin
      if AnsiCompareStr(ATexto[j],ATexto[min]) < 0 then
         min := j;
    end;
    aux := ATexto[i];
    ATexto[i] := ATexto[min];
    ATexto[min] := aux;
  end;
end;

class function TStringUtils.StringFormatada(const Texto: string;
  const Tamanho: Integer): string;
begin
  Result := Format('%-'+ IntToStr(Tamanho)+'s',[Copy(Texto,0,Tamanho)]);
end;

end.

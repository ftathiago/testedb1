unit Exercicios.DLL.Calculos;

interface

type
  TCalculos = class
    function CalcularAreaQuadrados(Lado1, Lado2: Double):Double;
    function CalcularPerimetroQuadrados(Lado1, Lado2: Double):Double;
    function CalcularAreaCirculo(Raio: Double):Double;
    function CalcularPerimetroCirculo(Raio: Double):Double;
  end;

implementation

{ TCalculos }

function TCalculos.CalcularAreaCirculo(Raio: Double): Double;
begin
  Result := 3.14 * Raio * Raio;
end;

function TCalculos.CalcularAreaQuadrados(Lado1, Lado2: Double): Double;
begin
  Result := Lado1 * Lado2;
end;

function TCalculos.CalcularPerimetroCirculo(Raio: Double): Double;
begin
  Result := 2 * 3.14 * Raio;
end;

function TCalculos.CalcularPerimetroQuadrados(Lado1,
  Lado2: Double): Double;
begin
  Result := (Lado1 * 2) + (Lado2 * 2);
end;

end.

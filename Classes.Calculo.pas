unit Classes.Calculo;

interface

type

  ICalculo = interface(IInterface)
    function CalcularArea: Double;
    function CalcularPerimetro: Double;
  end;

  TCalculoDLL = class(TInterfacedObject, ICalculo)
  protected
    procedure CarregarDLL(var Handle: THandle); virtual;
    function CalcularArea: Double; virtual; abstract;
    function CalcularPerimetro: Double; virtual; abstract;
  end;

  TCalculoQuadrado = class(TCalculoDLL)
  private
    FLado1: Double;
    FLado2: Double;
  public
    function CalcularArea: Double; override;
    function CalcularPerimetro: Double; override;
    constructor Create(const Lado1, Lado2: Double);
  end;

  TCalculoCirculo = class(TCalculoDLL)
  private
    FRaio: Double;
  public
    function CalcularArea: Double; override;
    function CalcularPerimetro: Double; override;
    constructor Create(const Raio: Double);
  end;

implementation

uses SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
 Forms, Dialogs, StdCtrls, Windows;

{ TCalculoQuadrado }

type
   TFuncCalcularQuadrado =  function (Lado1, Lado2: Double):Double;
   TFuncCalcularCirculo =  function (Raio: Double):Double;
const
  NOME_DLL = 'Exercicio06DLL.dll';

function TCalculoQuadrado.CalcularArea: Double;
var
  _handle: THandle;
  _calcularArea: TFuncCalcularQuadrado;
begin
  Result := 0;
  CarregarDLL(_handle);
  @_calcularArea := GetProcAddress(_handle,'CalcularAreaQuadrados');
  if Assigned(@_calcularArea) then
  begin
    Result := _calcularArea(FLado1,FLado2)
  end
  else
    RaiseLastOSError;
end;

function TCalculoQuadrado.CalcularPerimetro: Double;
var
  _handle: THandle;
  _calcularPerimetro: TFuncCalcularQuadrado;
begin
  Result := 0;
  CarregarDLL(_handle);
  @_calcularPerimetro := GetProcAddress(_handle,'CalcularPerimetroQuadrados');
  if Assigned(@_calcularPerimetro) then
  begin
    Result := _calcularPerimetro(FLado1,FLado2)
  end
  else
    RaiseLastOSError;
end;

constructor TCalculoQuadrado.Create(const Lado1, Lado2: Double);
begin
  inherited Create;
  FLado1 := Lado1;
  FLado2 := Lado2;
end;

{ TCalculoCirculo }

function TCalculoCirculo.CalcularArea: Double;
var
  _handle: THandle;
  _calcularArea: TFuncCalcularCirculo;
begin
  Result := 0;
  CarregarDLL(_handle);
  @_calcularArea := GetProcAddress(_handle,'CalcularAreaCirculo');
  if Assigned(@_calcularArea) then
  begin
    Result := _calcularArea(FRaio);
  end
  else
    RaiseLastOSError;
end;

function TCalculoCirculo.CalcularPerimetro: Double;
var
  _handle: THandle;
  _calcularPerimetro: TFuncCalcularCirculo;
begin
  Result := 0;
  CarregarDLL(_handle);
  @_calcularPerimetro := GetProcAddress(_handle,'CalcularPerimetroCirculo');
  if Assigned(@_calcularPerimetro) then
  begin
    Result := _calcularPerimetro(FRaio);
  end
  else
    RaiseLastOSError;
end;

constructor TCalculoCirculo.Create(const Raio: Double);
begin
  inherited Create;
  FRaio := Raio;
end;

{ TCalculoDLL }

procedure TCalculoDLL.CarregarDLL(var Handle: THandle);
begin
  if FileExists(NOME_DLL) then
  begin
    Handle := Windows.LoadLibrary(NOME_DLL);
    if Handle = 0 then
      raise EResNotFound.Create('Não foi possível acessar a DLL');
  end
  else
    raise EFilerError.CreateFmt('O arquivo %s não foi encontrado!',[NOME_DLL]);
end;

end.

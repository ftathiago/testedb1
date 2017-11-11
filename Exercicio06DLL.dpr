library Exercicio06DLL;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Exercicios.DLL.Calculos in 'Exercicios.DLL.Calculos.pas';

{$R *.res}

    function CalcularAreaQuadrados(Lado1, Lado2: Double):Double; stdcall;
    var
      _calculos: TCalculos;
    begin
      _calculos := TCalculos.Create;
      try
        Result := _calculos.CalcularAreaQuadrados(Lado1,Lado2);
      finally
        _calculos.Free;
      end;
    end;

    function CalcularPerimetroQuadrados(Lado1, Lado2: Double):Double; stdcall;
    var
      _calculos: TCalculos;
    begin
      _calculos := TCalculos.Create;
      try
        Result := _calculos.CalcularPerimetroQuadrados(Lado1,Lado2);
      finally
        _calculos.Free;
      end;
    end;

    function CalcularAreaCirculo(Raio: Double):Double; stdcall;
    var
      _calculos: TCalculos;
    begin
      _calculos := TCalculos.Create;
      try
        Result := _calculos.CalcularAreaCirculo(Raio);
      finally
        _calculos.Free;
      end;
    end;

    function CalcularPerimetroCirculo(Raio: Double):Double; stdcall;
    var
      _calculos: TCalculos;
    begin
      _calculos := TCalculos.Create;
      try
        Result := _calculos.CalcularPerimetroCirculo(Raio);
      finally
        _calculos.Free;
      end;
    end;

exports
    CalcularAreaQuadrados,
    CalcularPerimetroQuadrados,
    CalcularAreaCirculo,
    CalcularPerimetroCirculo;

begin
end.

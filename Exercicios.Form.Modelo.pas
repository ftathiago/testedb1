unit Exercicios.Form.Modelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList;

type
  TfrmModelo = class(TForm)
    ActionList: TActionList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmModelo: TfrmModelo;

implementation

{$R *.dfm}

procedure TfrmModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Self.FormStyle = fsMDIChild then
    Action := caFree;
end;

end.

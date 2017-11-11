program AvaliacaoDB1;

uses
  Forms,
  Exercicios.Form.Menu in 'Exercicios.Form.Menu.PAS' {frmMenu},
  Exercicios.Form.Exercicio01 in 'Exercicios.Form.Exercicio01.pas' {frmExercicio01},
  Classes.Conversao in 'Classes.Conversao.pas',
  Classes.Conversao.ConverteTexto in 'Classes.Conversao.ConverteTexto.pas',
  Classes.Conversao.ConverteInvertido in 'Classes.Conversao.ConverteInvertido.pas',
  Classes.Conversao.ConvertePrimeiraMaiuscula in 'Classes.Conversao.ConvertePrimeiraMaiuscula.pas',
  Exercicios.Form.Exercicio02 in 'Exercicios.Form.Exercicio02.pas' {frmExercicio02},
  Exercicios.Form.Modelo in 'Exercicios.Form.Modelo.pas' {frmModelo},
  Classes.Conversao.ConverteTextoFactory in 'Classes.Conversao.ConverteTextoFactory.pas',
  Classes.Conversao.ConverteOrdenado in 'Classes.Conversao.ConverteOrdenado.pas',
  Classes.Utils in 'Classes.Utils.pas',
  Exercicios.DMConexao in 'Exercicios.DMConexao.pas' {DMConexao: TDataModule},
  Exercicios.DataModule.Pessoa in 'Exercicios.DataModule.Pessoa.pas' {dmPessoa: TDataModule},
  Exercicios.DataModule.Cidade in 'Exercicios.DataModule.Cidade.pas' {dmCidade: TDataModule},
  Exercicios.Form.Pesquisa in 'Exercicios.Form.Pesquisa.pas' {frmPesquisa},
  Exercicios.DataModule.Intf.DM in 'Exercicios.DataModule.Intf.DM.pas',
  Exercicios.Form.Exercicio03 in 'Exercicios.Form.Exercicio03.pas' {frmExercicio03},
  Exercicios.Form.Exercicio04 in 'Exercicios.Form.Exercicio04.pas' {frmExercicio04},
  Exercicios.Form.Exercicio05 in 'Exercicios.Form.Exercicio05.pas' {frmExercicio05},
  Exercicios.Form.Exercicio06 in 'Exercicios.Form.Exercicio06.pas' {frmExercicio06},
  Classes.Calculo in 'Classes.Calculo.pas',
  Exercicios.Form.Exercicio07 in 'Exercicios.Form.Exercicio07.pas' {frmExercicio07};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TdmCidade, dmCidade);
  Application.CreateForm(TdmPessoa, dmPessoa);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.

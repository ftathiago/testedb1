object frmExercicio05: TfrmExercicio05
  Left = 332
  Top = 190
  Width = 583
  Height = 122
  Caption = 'Exerc'#237'cio 05 - Cria'#231#227'o de arquivos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 50
    Width = 575
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 182
      Top = 8
      Width = 75
      Height = 25
      Action = actSalvar
      TabOrder = 0
    end
    object Button2: TButton
      Left = 318
      Top = 8
      Width = 75
      Height = 25
      Action = actSair
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 50
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 9
      Top = 19
      Width = 82
      Height = 13
      Caption = 'Local do arquivo:'
    end
    object Button3: TButton
      Left = 464
      Top = 13
      Width = 75
      Height = 25
      Action = actSelecionar
      TabOrder = 0
    end
    object edtLocalDoArquivo: TEdit
      Left = 106
      Top = 16
      Width = 337
      Height = 21
      TabOrder = 1
    end
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
    Top = 56
    object actSalvar: TAction
      Caption = 'Salvar'
      OnExecute = actSalvarExecute
    end
    object actSair: TAction
      Caption = 'Sair'
      OnExecute = actSairExecute
    end
    object actSelecionar: TAction
      Caption = 'Selecionar'
      OnExecute = actSelecionarExecute
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.txt'
    FileName = 'C:\FranciscoThiagoDeAlmeida\Pessoas.txt'
    Filter = 'Arquivo texto|*.txt'
    InitialDir = 'c:\FranciscoThiagoDeAlmeida'
    Options = [ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofEnableSizing]
    Left = 40
    Top = 56
  end
end

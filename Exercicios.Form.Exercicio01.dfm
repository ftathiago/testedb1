inherited frmExercicio01: TfrmExercicio01
  Left = 298
  Top = 236
  Width = 577
  Height = 268
  Caption = 'Exerc'#237'cio 01 - Trabalhando com arrays'
  Font.Charset = DEFAULT_CHARSET
  Font.Name = 'MS Sans Serif'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object grpInserirNomes: TGroupBox [0]
    Left = 13
    Top = 12
    Width = 273
    Height = 57
    Caption = 'Inserir nomes:'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object edtNome: TEdit
      Left = 48
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 184
      Top = 24
      Width = 75
      Height = 25
      Action = actInserirNome
      Caption = 'Inserir'
      TabOrder = 1
    end
  end
  object grpOperacoes: TGroupBox [1]
    Left = 13
    Top = 76
    Width = 273
    Height = 153
    Caption = 'Opera'#231#245'es'
    TabOrder = 1
    object SpeedButton2: TSpeedButton
      Left = 24
      Top = 24
      Width = 225
      Height = 22
      Action = actRemoverPrimeiroNome
    end
    object SpeedButton3: TSpeedButton
      Left = 24
      Top = 56
      Width = 225
      Height = 22
      Action = actRemoverUltimoNome
    end
    object SpeedButton4: TSpeedButton
      Left = 24
      Top = 88
      Width = 225
      Height = 22
      Action = actContarNomes
    end
    object SpeedButton5: TSpeedButton
      Left = 24
      Top = 120
      Width = 225
      Height = 22
      Action = actSair
    end
  end
  object grpListaDeNomes: TGroupBox [2]
    Left = 293
    Top = 12
    Width = 273
    Height = 217
    Caption = 'Lista de nomes:'
    TabOrder = 2
    object SpeedButton6: TSpeedButton
      Left = 20
      Top = 24
      Width = 233
      Height = 22
      Action = actExibirNomes
    end
    object lbxListaNomes: TListBox
      Left = 20
      Top = 72
      Width = 233
      Height = 137
      Ctl3D = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  inherited ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 461
    Top = 180
    object actInserirNome: TAction
      Caption = 'Inserir'
      OnExecute = actInserirNomeExecute
    end
    object actRemoverPrimeiroNome: TAction
      Caption = 'Remover primeiro nome'
      OnExecute = actRemoverPrimeiroNomeExecute
    end
    object actRemoverUltimoNome: TAction
      Caption = 'Remover '#250'ltimo nome'
      OnExecute = actRemoverUltimoNomeExecute
    end
    object actContarNomes: TAction
      Caption = 'Contar nomes'
      OnExecute = actContarNomesExecute
    end
    object actSair: TAction
      Caption = 'Sair'
      OnExecute = actSairExecute
    end
    object actExibirNomes: TAction
      Caption = 'Exibir nomes'
      OnExecute = actExibirNomesExecute
    end
  end
end

inherited frmExercicio04: TfrmExercicio04
  Left = 314
  Top = 184
  Height = 436
  Caption = 'Exerc'#237'cio 04 - Cria'#231#227'o de Componentes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 8
    Top = 8
    Width = 273
    Height = 388
    Caption = 'Gera'#231#227'o de consulta:'
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 19
      Width = 44
      Height = 13
      Caption = 'Campos:'
    end
    object Label2: TLabel
      Left = 7
      Top = 127
      Width = 40
      Height = 13
      Caption = 'Tabelas:'
    end
    object Label3: TLabel
      Left = 7
      Top = 235
      Width = 57
      Height = 13
      Caption = 'Condi'#231#245'es:'
    end
    object memCampos: TMemo
      Left = 7
      Top = 35
      Width = 257
      Height = 77
      TabOrder = 0
    end
    object memTabelas: TMemo
      Left = 7
      Top = 143
      Width = 257
      Height = 77
      TabOrder = 1
    end
    object memCondicoes: TMemo
      Left = 7
      Top = 251
      Width = 257
      Height = 77
      TabOrder = 2
    end
    object btnConsultar: TButton
      Left = 99
      Top = 344
      Width = 75
      Height = 25
      Action = actConsultar
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox [1]
    Left = 296
    Top = 8
    Width = 369
    Height = 388
    Caption = 'Resultado:'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 365
      Height = 371
      Align = alClient
      DataSource = dtsTeste
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  inherited ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 32
    Top = 72
    object actConsultar: TAction
      Caption = 'Consultar'
      OnExecute = actConsultarExecute
    end
  end
  object dtsTeste: TDataSource
    DataSet = cdsDB1Data
    Left = 336
    Top = 248
  end
  object DB1Data: TDB1Data
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMConexao.AvaliacaoDB1
    Left = 336
    Top = 128
  end
  object dspDB1Data: TDataSetProvider
    DataSet = DB1Data
    Left = 336
    Top = 168
  end
  object cdsDB1Data: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDB1Data'
    Left = 336
    Top = 208
  end
end

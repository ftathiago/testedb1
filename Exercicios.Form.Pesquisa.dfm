object frmPesquisa: TfrmPesquisa
  Left = 523
  Top = 195
  Width = 624
  Height = 340
  ActiveControl = edtPesquisa
  Caption = 'Exerc'#237'cio 03 - Formul'#225'rio de pesquisa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object dbgPesquisa: TDBGrid
    Left = 0
    Top = 50
    Width = 616
    Height = 209
    Align = alClient
    DataSource = dtsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgPesquisaDblClick
  end
  object pnlControles: TPanel
    Left = 0
    Top = 0
    Width = 616
    Height = 50
    Align = alTop
    TabOrder = 1
    object lblDescricao: TLabel
      Left = 20
      Top = 17
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome:'
    end
    object edtPesquisa: TEdit
      Left = 56
      Top = 14
      Width = 221
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 284
      Top = 12
      Width = 75
      Height = 25
      Action = actPesquisar
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 259
    Width = 616
    Height = 50
    Align = alBottom
    TabOrder = 2
    object Button2: TButton
      Left = 12
      Top = 12
      Width = 75
      Height = 25
      Action = actSelecionar
      TabOrder = 0
    end
    object Button3: TButton
      Left = 100
      Top = 12
      Width = 75
      Height = 25
      Action = actCancelar
      TabOrder = 1
    end
  end
  object dtsPesquisa: TDataSource
    Left = 8
    Top = 136
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 264
    Top = 136
    object actPesquisar: TAction
      Caption = 'Pesquisar'
      OnExecute = actPesquisarExecute
    end
    object actSelecionar: TAction
      Caption = 'Selecionar'
      OnExecute = actSelecionarExecute
    end
    object actCancelar: TAction
      Caption = 'Cancelar'
      OnExecute = actCancelarExecute
    end
  end
end

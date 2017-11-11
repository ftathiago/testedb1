inherited frmExercicio03: TfrmExercicio03
  Left = 258
  Top = 216
  Width = 668
  Height = 247
  Caption = 'Exerc'#237'cio 03 - Tela de cadastro'
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 8
    Top = 8
    Width = 641
    Height = 201
    Caption = 'Cadastro de Pessoas'
    TabOrder = 0
    object Label1: TLabel
      Left = 92
      Top = 33
      Width = 30
      Height = 13
      Caption = 'Nome'
      FocusControl = NMPESSOA
    end
    object Label2: TLabel
      Left = 61
      Top = 59
      Width = 61
      Height = 13
      Caption = 'Logradouro'
      FocusControl = DELOGRADOURO
    end
    object Label3: TLabel
      Left = 91
      Top = 87
      Width = 31
      Height = 13
      Caption = 'Bairro'
      FocusControl = DEBAIRRO
    end
    object Label5: TLabel
      Left = 86
      Top = 115
      Width = 36
      Height = 13
      Caption = 'Cidade'
      FocusControl = NMCIDADE
    end
    object NMPESSOA: TDBEdit
      Left = 130
      Top = 29
      Width = 450
      Height = 21
      DataField = 'NMPESSOA'
      DataSource = dtsDados
      TabOrder = 0
    end
    object DELOGRADOURO: TDBEdit
      Left = 130
      Top = 56
      Width = 450
      Height = 21
      DataField = 'DELOGRADOURO'
      DataSource = dtsDados
      TabOrder = 1
    end
    object DEBAIRRO: TDBEdit
      Left = 130
      Top = 84
      Width = 450
      Height = 21
      DataField = 'DEBAIRRO'
      DataSource = dtsDados
      TabOrder = 2
    end
    object CDCIDADE: TDBEdit
      Left = 442
      Top = 112
      Width = 49
      Height = 21
      TabStop = False
      DataField = 'CDCIDADE'
      DataSource = dtsDados
      Enabled = False
      TabOrder = 3
    end
    object NMCIDADE: TDBEdit
      Left = 130
      Top = 112
      Width = 305
      Height = 21
      TabStop = False
      DataField = 'NMCIDADE'
      DataSource = dtsDados
      Enabled = False
      TabOrder = 4
    end
    object BitBtn1: TBitBtn
      Left = 498
      Top = 108
      Width = 81
      Height = 25
      Action = actPesquisarCidade
      Caption = 'Pesquisar'
      TabOrder = 5
    end
    object pnlControles: TPanel
      Left = 36
      Top = 152
      Width = 569
      Height = 41
      TabOrder = 6
      object Button1: TButton
        Left = 11
        Top = 8
        Width = 75
        Height = 25
        Action = actNovo
        TabOrder = 0
      end
      object Button2: TButton
        Left = 105
        Top = 8
        Width = 75
        Height = 25
        Action = actSalvar
        TabOrder = 1
      end
      object Button3: TButton
        Left = 199
        Top = 8
        Width = 75
        Height = 25
        Action = actEditar
        TabOrder = 2
      end
      object Button4: TButton
        Left = 294
        Top = 8
        Width = 75
        Height = 25
        Action = actApagar
        TabOrder = 3
      end
      object Button5: TButton
        Left = 388
        Top = 8
        Width = 75
        Height = 25
        Action = actPesquisar
        TabOrder = 4
      end
      object Button6: TButton
        Left = 483
        Top = 8
        Width = 75
        Height = 25
        Action = actSair
        TabOrder = 5
      end
    end
  end
  inherited ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 16
    Top = 120
    object actPesquisarCidade: TAction
      Caption = 'Pesquisar'
      OnExecute = actPesquisarCidadeExecute
    end
    object actNovo: TDataSetInsert
      Category = 'Dataset'
      Caption = 'Novo'
      DataSource = dtsDados
    end
    object actApagar: TDataSetDelete
      Category = 'Dataset'
      Caption = 'Excluir'
      DataSource = dtsDados
    end
    object actEditar: TDataSetEdit
      Category = 'Dataset'
      Caption = 'Editar'
      DataSource = dtsDados
    end
    object actSalvar: TDataSetPost
      Category = 'Dataset'
      Caption = 'Salvar'
    end
    object actPesquisar: TAction
      Category = 'Dataset'
      Caption = 'Pesquisar'
      OnExecute = actPesquisarExecute
    end
    object actSair: TAction
      Category = 'Dataset'
      Caption = 'Sair'
      OnExecute = actSairExecute
    end
  end
  object dtsDados: TDataSource
    Left = 16
    Top = 88
  end
end

inherited frmExercicio06: TfrmExercicio06
  Left = 250
  Top = 192
  Width = 674
  Height = 199
  Caption = 'Exerc'#237'cio 06 - Utiliza'#231#227'o de bibliotecas din'#226'micas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 8
    Top = 8
    Width = 649
    Height = 73
    Caption = 'Quadrado:'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 31
      Height = 13
      Caption = 'Lado: '
    end
    object Label2: TLabel
      Left = 482
      Top = 32
      Width = 31
      Height = 13
      Caption = 'Lado: '
    end
    object edtLado: TEdit
      Left = 51
      Top = 29
      Width = 158
      Height = 21
      TabOrder = 0
    end
    object rgpCalculoQuadrado: TRadioGroup
      Left = 224
      Top = 16
      Width = 153
      Height = 41
      Caption = 'C'#225'lculo:'
      Columns = 2
      Items.Strings = (
        #193'rea'
        'Per'#237'metro')
      TabOrder = 1
    end
    object Button1: TButton
      Left = 394
      Top = 25
      Width = 75
      Height = 25
      Action = actCalcularQuadrado
      TabOrder = 2
    end
    object edtResultadoQuadrado: TEdit
      Left = 517
      Top = 29
      Width = 117
      Height = 21
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox [1]
    Left = 8
    Top = 88
    Width = 649
    Height = 73
    Caption = 'C'#237'rculo:'
    TabOrder = 1
    object Label3: TLabel
      Left = 16
      Top = 32
      Width = 26
      Height = 13
      Caption = 'Raio:'
    end
    object Label4: TLabel
      Left = 482
      Top = 32
      Width = 31
      Height = 13
      Caption = 'Lado: '
    end
    object edtRaio: TEdit
      Left = 51
      Top = 29
      Width = 158
      Height = 21
      TabOrder = 0
    end
    object rgpCalculoCirculo: TRadioGroup
      Left = 224
      Top = 16
      Width = 153
      Height = 41
      Caption = 'C'#225'lculo:'
      Columns = 2
      Items.Strings = (
        #193'rea'
        'Per'#237'metro')
      TabOrder = 1
    end
    object Button2: TButton
      Left = 394
      Top = 25
      Width = 75
      Height = 25
      Action = actCalcularCirculo
      TabOrder = 2
    end
    object edtResultadoCirculo: TEdit
      Left = 517
      Top = 29
      Width = 117
      Height = 21
      TabOrder = 3
    end
  end
  inherited ActionList: TActionList
    Left = 144
    Top = 72
    object actCalcularQuadrado: TAction
      Caption = 'Calcular'
      OnExecute = actCalcularQuadradoExecute
    end
    object actCalcularCirculo: TAction
      Caption = 'Calcular'
      OnExecute = actCalcularCirculoExecute
    end
  end
end

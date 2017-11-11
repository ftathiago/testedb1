inherited frmExercicio02: TfrmExercicio02
  Left = 261
  Top = 233
  Height = 252
  Caption = 'Exerc'#237'cio 02 - Classes de convers'#227'o de texto'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 7
    Top = 10
    Width = 72
    Height = 13
    Caption = 'Texto original:'
  end
  object Label2: TLabel [1]
    Left = 247
    Top = 138
    Width = 111
    Height = 13
    Caption = 'Quantidade de letras:'
  end
  object SpeedButton1: TSpeedButton [2]
    Left = 247
    Top = 186
    Width = 185
    Height = 22
    Action = actConverter
  end
  object Label3: TLabel [3]
    Left = 439
    Top = 10
    Width = 87
    Height = 13
    Caption = 'Texto convertido:'
  end
  object edtTextoOriginal: TMemo [4]
    Left = 7
    Top = 26
    Width = 225
    Height = 185
    TabOrder = 0
  end
  object rgpTipoConversao: TRadioGroup [5]
    Left = 247
    Top = 26
    Width = 185
    Height = 105
    Caption = 'Op'#231#245'es de convers'#227'o'
    Items.Strings = (
      'Invertido'
      'Primeira mai'#250'scula'
      'Ordem alfab'#233'tica')
    TabOrder = 1
  end
  object edtQtdLetras: TEdit [6]
    Left = 247
    Top = 154
    Width = 185
    Height = 21
    TabOrder = 2
  end
  object edtTextoConvertido: TMemo [7]
    Left = 439
    Top = 26
    Width = 225
    Height = 185
    TabOrder = 3
  end
  inherited ActionList: TActionList
    Left = 16
    Top = 88
    object actConverter: TAction
      Caption = 'Converter'
      OnExecute = actConverterExecute
    end
  end
end

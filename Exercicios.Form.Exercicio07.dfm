object frmExercicio07: TfrmExercicio07
  Left = 267
  Top = 192
  Width = 564
  Height = 173
  Caption = 'Exerc'#237'cio 07 - Processos concorrentes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 556
    Height = 101
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Thread 1:'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 46
      Height = 13
      Caption = 'Thread 2:'
    end
    object Label3: TLabel
      Left = 416
      Top = 16
      Width = 52
      Height = 13
      Caption = 'Sleep (ms):'
    end
    object Label4: TLabel
      Left = 416
      Top = 56
      Width = 52
      Height = 13
      Caption = 'Sleep (ms):'
    end
    object progThread1: TProgressBar
      Left = 16
      Top = 32
      Width = 361
      Height = 17
      TabOrder = 0
    end
    object progThread2: TProgressBar
      Left = 16
      Top = 72
      Width = 361
      Height = 17
      TabOrder = 1
    end
    object edtSleep1: TEdit
      Left = 416
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object edtSleep2: TEdit
      Left = 416
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 3
      Text = '0'
    end
  end
  object pnlControles: TPanel
    Left = 0
    Top = 101
    Width = 556
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Action = actExecutar
      TabOrder = 0
    end
    object btnSair: TButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Action = actSair
      TabOrder = 1
    end
  end
  object ActionList: TActionList
    Left = 8
    Top = 112
    object actExecutar: TAction
      Caption = 'Executar'
      OnExecute = actExecutarExecute
    end
    object actSair: TAction
      Caption = 'Sair'
      OnExecute = actSairExecute
    end
  end
end

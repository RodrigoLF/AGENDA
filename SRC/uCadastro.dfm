object frmCadastro: TfrmCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 212
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 642
    Height = 212
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 21
      Width = 133
      Height = 13
      Caption = 'Digite um nome de usu'#225'rio: '
    end
    object Label2: TLabel
      Left = 16
      Top = 67
      Width = 89
      Height = 13
      Caption = 'Digita uma senha: '
    end
    object Label3: TLabel
      Left = 16
      Top = 116
      Width = 132
      Height = 13
      Caption = 'Insira a senha novamente: '
    end
    object edcadusuario: TEdit
      Left = 16
      Top = 40
      Width = 601
      Height = 21
      TabOrder = 0
    end
    object edcadsenha: TEdit
      Left = 16
      Top = 86
      Width = 601
      Height = 21
      TabOrder = 1
    end
    object edcadsenha2: TEdit
      Left = 16
      Top = 135
      Width = 601
      Height = 21
      TabOrder = 2
    end
    object btCad: TButton
      Left = 16
      Top = 168
      Width = 177
      Height = 33
      Caption = 'Cadastrar'
      Default = True
      TabOrder = 3
      OnClick = btCadClick
    end
  end
end

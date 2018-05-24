object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  ActiveControl = btLogin
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Login'
  ClientHeight = 189
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 397
    Height = 189
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 37
      Top = 16
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object Label2: TLabel
      Left = 38
      Top = 61
      Width = 37
      Height = 13
      Caption = 'Senha: '
    end
    object btLogin: TButton
      Left = 37
      Top = 120
      Width = 140
      Height = 35
      Caption = 'Login '
      Default = True
      TabOrder = 0
      OnClick = btLoginClick
    end
    object edusuario: TEdit
      Left = 38
      Top = 32
      Width = 311
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      TabOrder = 1
    end
    object mesenha: TMaskEdit
      Left = 37
      Top = 80
      Width = 312
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 15
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
      Text = ''
      OnKeyPress = mesenhaKeyPress
    end
    object btCad: TButton
      Left = 210
      Top = 120
      Width = 139
      Height = 35
      Caption = 'Cadastre-se'
      TabOrder = 3
      OnClick = btCadClick
    end
  end
end

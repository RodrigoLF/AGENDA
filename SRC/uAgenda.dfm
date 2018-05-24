object frmAgenda: TfrmAgenda
  Left = 0
  Top = 0
  Caption = 'Agenda'
  ClientHeight = 528
  ClientWidth = 939
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainmenu
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sgAgenda: TStringGrid
    Left = 254
    Top = 8
    Width = 667
    Height = 515
    Align = alCustom
    ColCount = 10
    DoubleBuffered = False
    FixedCols = 0
    RowCount = 100
    FixedRows = 0
    GradientEndColor = clBtnFace
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = sgAgendaClick
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64
      64
      64
      64)
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 240
    Height = 515
    Align = alCustom
    Caption = ' Filtros de pesquisa '
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 19
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label2: TLabel
      Left = 27
      Top = 60
      Width = 32
      Height = 13
      Caption = 'Idade:'
    end
    object Label4: TLabel
      Left = 24
      Top = 103
      Width = 98
      Height = 13
      Caption = 'Telefone Comercial: '
    end
    object Label5: TLabel
      Left = 24
      Top = 144
      Width = 105
      Height = 13
      Caption = 'Telefone Residencial: '
    end
    object Label3: TLabel
      Left = 24
      Top = 186
      Width = 45
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label6: TLabel
      Left = 24
      Top = 223
      Width = 35
      Height = 13
      Caption = 'Bairro: '
    end
    object Label7: TLabel
      Left = 25
      Top = 261
      Width = 26
      Height = 13
      Caption = 'CEP: '
    end
    object rgSexo: TRadioGroup
      Left = 16
      Top = 379
      Width = 209
      Height = 62
      Caption = ' Sexo '
      Items.Strings = (
        'Masculino'
        'Feminino')
      TabOrder = 8
    end
    object edNome: TEdit
      Left = 24
      Top = 33
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edEndereco: TEdit
      Left = 24
      Top = 200
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object edBairro: TEdit
      Left = 24
      Top = 237
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object btCadastrar: TButton
      Left = 16
      Top = 447
      Width = 209
      Height = 25
      Caption = 'Inserir novo contato'
      TabOrder = 9
      OnClick = btCadastrarClick
    end
    object edIdade: TEdit
      Left = 24
      Top = 76
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object rgEstCiv: TRadioGroup
      Left = 16
      Top = 304
      Width = 209
      Height = 71
      Caption = ' Estado Civil '
      Columns = 2
      Items.Strings = (
        'Solteiro'
        'Casado'
        'Separado'
        'Divorciado'
        'Vi'#250'vo')
      TabOrder = 7
    end
    object edTelCom: TMaskEdit
      Left = 25
      Top = 117
      Width = 120
      Height = 21
      EditMask = '!\(99\)0000-0000;1;_'
      MaxLength = 13
      TabOrder = 2
      Text = '(  )    -    '
    end
    object edTelRes: TMaskEdit
      Left = 24
      Top = 159
      Width = 121
      Height = 21
      EditMask = '!\(99\)00000-0000;1;_'
      MaxLength = 14
      TabOrder = 3
      Text = '(  )     -    '
    end
    object edCEP: TMaskEdit
      Left = 24
      Top = 276
      Width = 121
      Height = 21
      EditMask = '00000\-000;1;_'
      MaxLength = 9
      TabOrder = 6
      Text = '     -   '
    end
    object btEditar: TButton
      Left = 16
      Top = 478
      Width = 209
      Height = 25
      Caption = 'Atualizar Informa'#231#245'es'
      Enabled = False
      TabOrder = 10
      OnClick = btEditarClick
    end
  end
  object mainmenu: TMainMenu
    Left = 208
    Top = 24
    object ARQUIVO1: TMenuItem
      Caption = 'ARQUIVO'
      object INSERIR1: TMenuItem
        Caption = 'SALVAR'
        OnClick = INSERIR1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object sAIR1: TMenuItem
        Caption = 'SAIR'
        OnClick = sAIR1Click
      end
    end
    object EDITAR1: TMenuItem
      Caption = 'EDITAR'
      object filtrarnome: TMenuItem
        Caption = 'BUSCAR NOME'
        OnClick = filtrarnomeClick
      end
      object BUSCARSEXO1: TMenuItem
        Caption = 'BUSCAR SEXO'
        OnClick = BUSCARSEXO1Click
      end
      object DELETAR1: TMenuItem
        Caption = 'DELETAR'
        Enabled = False
        GroupIndex = 1
        OnClick = DELETAR1Click
      end
      object EditarContato1: TMenuItem
        Caption = 'EDITAR CONTATO'
        Enabled = False
        GroupIndex = 1
        OnClick = EditarContato1Click
      end
    end
    object AJUDA1: TMenuItem
      Caption = 'AJUDA'
      object SOBRE1: TMenuItem
        Caption = 'SOBRE'
        OnClick = SOBRE1Click
      end
    end
    object ATUALIZAR1: TMenuItem
      Caption = 'ATUALIZAR'
      OnClick = ATUALIZAR1Click
    end
  end
end

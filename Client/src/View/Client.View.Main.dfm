object ViewMain: TViewMain
  Left = 0
  Top = 0
  Caption = 'Cosulta CPF'
  ClientHeight = 271
  ClientWidth = 675
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlCep: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 669
    Height = 38
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitWidth = 541
    object lblCep: TLabel
      AlignWithMargins = True
      Left = 299
      Top = 4
      Width = 70
      Height = 30
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Fonte'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lblFonte: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 100
      Height = 30
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Logradouro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object lblDadoServico: TLabel
      AlignWithMargins = True
      Left = 375
      Top = 4
      Width = 183
      Height = 30
      Align = alClient
      AutoSize = False
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 98
      ExplicitTop = 0
      ExplicitWidth = 439
    end
    object edtCep: TEdit
      AlignWithMargins = True
      Left = 110
      Top = 4
      Width = 183
      Height = 30
      Align = alLeft
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 98
      ExplicitHeight = 27
    end
    object btnConsultar: TButton
      AlignWithMargins = True
      Left = 564
      Top = 4
      Width = 101
      Height = 30
      Align = alRight
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnConsultarClick
      ExplicitLeft = 520
      ExplicitTop = 1
      ExplicitHeight = 36
    end
  end
  object pnlLogradouro: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 47
    Width = 669
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = -2
    ExplicitWidth = 541
    object lblLogradouro: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 100
      Height = 32
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Logradouro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitHeight = 30
    end
    object lblDadoLogradouro: TLabel
      AlignWithMargins = True
      Left = 109
      Top = 3
      Width = 557
      Height = 32
      Align = alClient
      AutoSize = False
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 98
      ExplicitTop = 0
      ExplicitWidth = 439
      ExplicitHeight = 30
    end
  end
  object pnlComplemento: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 91
    Width = 669
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitLeft = 6
    ExplicitTop = 55
    ExplicitWidth = 541
    object lblCompemento: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 100
      Height = 32
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Complemento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitHeight = 30
    end
    object lblDadoComplemento: TLabel
      AlignWithMargins = True
      Left = 109
      Top = 3
      Width = 557
      Height = 32
      Align = alClient
      AutoSize = False
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 98
      ExplicitTop = 0
      ExplicitWidth = 439
      ExplicitHeight = 30
    end
  end
  object pnlBairro: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 135
    Width = 669
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitLeft = 6
    ExplicitTop = 99
    ExplicitWidth = 541
    object lblBairro: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 100
      Height = 32
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Bairro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitHeight = 30
    end
    object lblDadoBairro: TLabel
      AlignWithMargins = True
      Left = 109
      Top = 3
      Width = 557
      Height = 32
      Align = alClient
      AutoSize = False
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 98
      ExplicitTop = 0
      ExplicitWidth = 439
      ExplicitHeight = 30
    end
  end
  object pnlCidade: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 179
    Width = 669
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitLeft = -2
    ExplicitTop = 223
    ExplicitWidth = 541
    object lbllocalidade: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 100
      Height = 32
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitTop = 0
    end
    object lblDadoLocalidade: TLabel
      AlignWithMargins = True
      Left = 109
      Top = 3
      Width = 557
      Height = 32
      Align = alClient
      AutoSize = False
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 98
      ExplicitTop = 0
      ExplicitWidth = 439
      ExplicitHeight = 30
    end
  end
  object pnlUF: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 223
    Width = 669
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    ExplicitLeft = 6
    ExplicitTop = 187
    ExplicitWidth = 541
    object lblUF: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 100
      Height = 32
      Align = alLeft
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Estado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitHeight = 30
    end
    object lblDadoUF: TLabel
      AlignWithMargins = True
      Left = 109
      Top = 3
      Width = 557
      Height = 32
      Align = alClient
      AutoSize = False
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 98
      ExplicitTop = 0
      ExplicitWidth = 439
      ExplicitHeight = 30
    end
  end
end

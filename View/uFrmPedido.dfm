object FrmPedido: TFrmPedido
  Left = 0
  Top = 0
  Caption = 'FrmPedido'
  ClientHeight = 353
  ClientWidth = 760
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 39
      Height = 16
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 160
      Top = 16
      Width = 76
      Height = 16
      Caption = 'Nome Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EdtCodCli: TEdit
      Left = 15
      Top = 36
      Width = 121
      Height = 21
      TabOrder = 0
      OnExit = EdtCodCliExit
    end
    object EdtNomeCli: TEdit
      Left = 160
      Top = 36
      Width = 401
      Height = 21
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 760
    Height = 288
    Align = alClient
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 1
    object Label3: TLabel
      Left = 16
      Top = 35
      Width = 39
      Height = 16
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 103
      Top = 35
      Width = 33
      Height = 16
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 459
      Top = 35
      Width = 78
      Height = 16
      Caption = 'Valor Unit'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 370
      Top = 35
      Width = 65
      Height = 16
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 558
      Top = 35
      Width = 29
      Height = 16
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 700
      Top = 264
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object edtCodPro: TEdit
      Tag = 5
      Left = 16
      Top = 50
      Width = 81
      Height = 21
      Hint = 'Codigo do Produto'
      TabOrder = 0
      OnExit = edtCodProExit
    end
    object edtNomePro: TEdit
      Tag = 5
      Left = 103
      Top = 50
      Width = 261
      Height = 21
      Hint = 'Nome do Produto'
      ReadOnly = True
      TabOrder = 1
    end
    object edtValorUnit: TEdit
      Tag = 5
      Left = 461
      Top = 51
      Width = 81
      Height = 21
      Hint = 'Valor Unitario'
      ReadOnly = True
      TabOrder = 2
      OnExit = edtQuantExit
    end
    object edtVlrTotal: TEdit
      Tag = 5
      Left = 558
      Top = 50
      Width = 81
      Height = 21
      Hint = 'Total'
      ReadOnly = True
      TabOrder = 3
      Text = '0,00'
    end
    object edtQuant: TEdit
      Tag = 5
      Left = 370
      Top = 51
      Width = 81
      Height = 21
      Hint = 'Quantidade'
      TabOrder = 4
      Text = '1,00'
      OnExit = edtQuantExit
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 88
      Width = 715
      Height = 161
      DataSource = DSItens
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Title.Caption = 'CODIGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'DESCRICAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'QUANTIDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco_venda'
          Title.Caption = 'VALOR UNITATIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco_total'
          Title.Caption = 'TOTAL'
          Visible = True
        end>
    end
    object BtnGravar: TButton
      Left = 656
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 6
      OnClick = BtnGravarClick
    end
    object BtnFinalizar: TButton
      Left = 22
      Top = 255
      Width = 75
      Height = 25
      Caption = 'Finalizar'
      TabOrder = 7
      OnClick = BtnFinalizarClick
    end
  end
  object DSItens: TDataSource
    DataSet = MTItens
    Left = 240
    Top = 201
  end
  object MTItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 344
    Top = 185
    object MTItenscodigo: TIntegerField
      FieldName = 'codigo'
    end
    object MTItensdescricao: TStringField
      FieldName = 'descricao'
      Size = 45
    end
    object MTItensquantidade: TFloatField
      FieldName = 'quantidade'
    end
    object MTItenspreco_venda: TCurrencyField
      FieldName = 'preco_venda'
    end
    object MTItenspreco_total: TCurrencyField
      FieldName = 'preco_total'
    end
  end
end

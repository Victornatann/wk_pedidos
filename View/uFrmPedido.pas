unit uFrmPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, ProdutoModel,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, ClienteModel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uClienteController;

type
  TFrmPedido = class(TForm)
    EdtCodCli: TEdit;
    Panel1: TPanel;
    EdtNomeCli: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtCodPro: TEdit;
    edtNomePro: TEdit;
    edtValorUnit: TEdit;
    edtVlrTotal: TEdit;
    edtQuant: TEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    BtnGravar: TButton;
    DSItens: TDataSource;
    MTItensdescricao: TStringField;
    MTItenspreco_venda: TCurrencyField;
    MTItenscodigo: TIntegerField;
    MTItensquantidade: TFloatField;
    MTItenspreco_total: TCurrencyField;
    Label8: TLabel;
    MTItens: TFDMemTable;
    BtnFinalizar: TButton;

    procedure edtCodProExit(Sender: TObject);
    procedure EdtCodCliExit(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtQuantExit(Sender: TObject);
    procedure BtnFinalizarClick(Sender: TObject);
  private
    cTotal: Currency;
    Produto: TProdutoModel;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPedido: TFrmPedido;

implementation

{$R *.dfm}

uses uProdutoController, uUtils, uPedidoController;

procedure TFrmPedido.BtnGravarClick(Sender: TObject);

begin

  ValidarCamposObrigatorios(FrmPedido);

  if Not(MTItens.State = dsEdit) then
    MTItens.Append;

  MTItenscodigo.AsInteger := StrToInt(edtCodPro.Text);
  MTItensdescricao.AsString := edtNomePro.Text;
  MTItenspreco_venda.AsCurrency := StrToCurr(edtValorUnit.Text);
  MTItensquantidade.AsFloat := StrToFloat(edtQuant.Text);
  MTItenspreco_total.AsCurrency := StrToCurr(edtVlrTotal.Text);

  MTItens.Post;
  cTotal := cTotal + StrToCurr(edtVlrTotal.Text);
  Label8.Caption := FormatFloat('#0.00', cTotal);

end;

procedure TFrmPedido.BtnFinalizarClick(Sender: TObject);
begin
  if TPedidoController.GravarPedido(StrToInt(EdtCodCli.Text),
    StrToCurr(Label8.Caption), MTItens) then
    MessageDlg('Pedido gravado com sucesso', mtConfirmation, [mbOK], 0)
  else
    MessageDlg('erro ao gravar o pedido', mtWarning, [mbOK], 0);

end;

procedure TFrmPedido.EdtCodCliExit(Sender: TObject);
var
  Cliente: TClienteModel;
begin
  if Trim(EdtCodCli.Text) = '' then
  begin
    EdtCodCli.SetFocus;
    exit;
  end;

  Cliente := TClienteController.BuscaClienteId(StrToInt(EdtCodCli.Text));

  if Cliente.codigo > 0 then
  begin
    EdtNomeCli.Text := Cliente.nome;
  end;

end;

procedure TFrmPedido.edtCodProExit(Sender: TObject);

begin
  Produto := TProdutoController.BuscaProdutoId(StrToInt(edtCodPro.Text));

  if Produto.codigo > 0 then
  begin
    edtNomePro.Text := Produto.descricao;
    edtValorUnit.Text := FormatFloat('#0.00', Produto.preco_venda);
    edtVlrTotal.Text := FormatFloat('#0.00',
      TPedidoController.CalculaTotal(StrToCurr(edtQuant.Text),
      StrToCurr(edtValorUnit.Text)));
  end;

end;

procedure TFrmPedido.edtQuantExit(Sender: TObject);
begin
  edtVlrTotal.Text := FormatFloat('#0.00',
    TPedidoController.CalculaTotal(StrToCurr(edtQuant.Text),
    StrToCurr(edtValorUnit.Text)));
end;

procedure TFrmPedido.FormCreate(Sender: TObject);
begin
  MTItens.Open;
  cTotal := 0;

end;

end.

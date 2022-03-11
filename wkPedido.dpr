program wkPedido;

uses
  Vcl.Forms,
  uProdutoController in 'Controller\uProdutoController.pas',
  ClienteModel in 'Model\ClienteModel.pas',
  uClienteController in 'Controller\uClienteController.pas',
  uUtils in 'Units\uUtils.pas',
  uPedidoController in 'Controller\uPedidoController.pas',
  uConexaoFiredac in 'Units\uConexaoFiredac.pas',
  uFrmPedido in 'View\uFrmPedido.pas' {FrmPedido},
  ProdutoModel in 'Model\ProdutoModel.pas',
  uDm in 'Sources\uDm.pas' {Dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPedido, FrmPedido);
  Application.CreateForm(TDm, Dm);
  Application.Run;
end.

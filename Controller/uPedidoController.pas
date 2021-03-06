unit uPedidoController;

interface

uses FireDAC.Comp.Client, uConexaoFiredac;

Type
  TPedidoController = class
  public
    class function CalculaTotal(cQuant, cVlr: Currency): Currency;
    class function GravarPedido(codcli: Integer; vlrpedido: Currency;
      DataSet: TFDMemTable): Boolean;

  end;

implementation

{ TPedidoController }

uses uDm, System.SysUtils;

class function TPedidoController.CalculaTotal(cQuant, cVlr: Currency): Currency;
begin
  Result := cQuant * cVlr;
end;

class function TPedidoController.GravarPedido(codcli: Integer;
  vlrpedido: Currency; DataSet: TFDMemTable): Boolean;
var
  Query: TFDQuery;
  Transaction: TFDTransaction;
  iCodPedido, iOrdem: Integer;

begin
  Result := false;
  iCodPedido := 0;
  iOrdem := 0;

  Transaction := TFDTransaction.Create(Nil);
  Transaction.Connection := Dm.FConexao;

  if Transaction.Active then
    Transaction.Commit;
  Transaction.StartTransaction;

  try
    try

      Query := TConexaoFiredac.getInstancia.prepareStatement
        ('insert into PEDIDO_VENDA ( data_emissao, ' +
        ' cod_cli, valor_pedido) values ( :DATA_EMISSAO, ' +
        ':COD_CLI, :VALOR_PEDIDO)  ');
      Query.Transaction := Transaction;

      Query.parambyname('DATA_EMISSAO').AsDate := Date();
      Query.parambyname('COD_CLI').AsInteger := codcli;
      Query.parambyname('VALOR_PEDIDO').AsCurrency := vlrpedido;

      Query.ExecSQL;
      Transaction.Commit;

      Query := TConexaoFiredac.getInstancia.prepareStatement
        ('SELECT LAST_INSERT_ID() as codigo ');
      Query.Open;

      iCodPedido := Query.FieldByName('codigo').AsInteger;

      if Transaction.Active then
        Transaction.Commit;
      Transaction.StartTransaction;

      with DataSet do
      begin
        First;
        while not eof do
        begin;
          Inc(iOrdem);
          Query := TConexaoFiredac.getInstancia.prepareStatement
            ('insert into  ITENS_PEDIDO_VENDA (COD_PED, ORDEM, COD_PRO, ' +
            'QUANT, VALOR, TOTAL) ' +
            'values (:COD_PED, :ORDEM, :COD_PRO, :QUANT, :VALOR, :TOTAL)  ');

          Query.parambyname('COD_PED').AsInteger := iCodPedido;
          Query.parambyname('ORDEM').AsInteger := iOrdem;
          Query.parambyname('COD_PRO').AsInteger :=
            DataSet.FieldByName('codigo').AsInteger;

          Query.parambyname('QUANT').AsFloat :=
            DataSet.FieldByName('quantidade').AsFloat;
          Query.parambyname('VALOR').AsCurrency :=
            DataSet.FieldByName('preco_venda').AsCurrency;
          Query.parambyname('TOTAL').AsCurrency :=
            DataSet.FieldByName('preco_total').AsCurrency;
          Query.ExecSQL;

          Next;
        end;
      end;
      Transaction.Commit;
      Result := true;
    finally
      TConexaoFiredac.getInstancia.closeConnection(Query);
    end;
  except
    Transaction.Rollback;
  end;
end;

end.

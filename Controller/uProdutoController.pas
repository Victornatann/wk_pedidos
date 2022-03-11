unit uProdutoController;

interface

uses ProdutoModel, FireDAC.DApt, FireDAC.Comp.Client, System.SysUtils;

Type
  TProdutoController = class

    class function BuscaProdutoId(cod: integer): TProdutoModel;
  end;

implementation

{ TProdutoController }

uses uDm, uConexaoFiredac;

class function TProdutoController.BuscaProdutoId(cod: integer): TProdutoModel;
var
  QueryCons: TFDQuery;
  Produto: TProdutoModel;
begin
  try

    Produto := TProdutoModel.Create();

    QueryCons := TConexaoFiredac.getInstancia.prepareStatement
      ('select * from Produto where codigo = :cod');
    QueryCons.parambyname('cod').AsInteger := cod;
    QueryCons.Open;

    if Not(QueryCons.IsEmpty) then
    Begin

      Produto.codigo := QueryCons.FieldByName('codigo').AsInteger;
      Produto.descricao := QueryCons.FieldByName('descricao').AsString;
      Produto.preco_venda := QueryCons.FieldByName('preco_venda').AsFloat;

    End;

    Result := Produto;

  finally
    TConexaoFiredac.getInstancia.closeConnection(QueryCons);
  end;

end;

end.

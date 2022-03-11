unit uClienteController;

interface

uses FireDAC.Comp.Client, FireDAC.DApt, System.SysUtils, ClienteModel;

Type
  TClienteController = class
  public

    class function BuscaClienteId(cod: integer): TClienteModel;
  end;

implementation

{ TClienteController }

uses uDm, uConexaoFiredac;

class function TClienteController.BuscaClienteId(cod: integer): TClienteModel;
var
  QueryCons: TFDQuery;
  Cliente: TClienteModel;
begin
  try

    Cliente := TClienteModel.Create();

    QueryCons := TConexaoFiredac.getInstancia.prepareStatement
      ('select * from cliente where codigo = :cod');
    QueryCons.parambyname('cod').AsInteger := cod;
    QueryCons.open;

    if Not(QueryCons.IsEmpty) then
    Begin

      Cliente.codigo := QueryCons.FieldByName('codigo').AsInteger;
      Cliente.nome := QueryCons.FieldByName('nome').AsString;
      Cliente.uf := QueryCons.FieldByName('uf').AsString;
      Cliente.cidade := QueryCons.FieldByName('cidade').AsString;

    End;

    Result := Cliente;

  finally
    TConexaoFiredac.getInstancia.closeConnection(QueryCons);
  end;

end;

end.

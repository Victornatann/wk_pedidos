unit ProdutoModel;

interface

Type
  TProdutoModel = class
  private
    Fpreco_venda: double;
    Fdescricao: String;
    Fcodigo: Integer;

  public

    property codigo: Integer read Fcodigo write Fcodigo;
    property descricao: String read Fdescricao write Fdescricao;
    property preco_venda: double read Fpreco_venda write Fpreco_venda;

    constructor create;
    destructor destroy; override;

  end;

implementation

{ TProdutoModel }

constructor TProdutoModel.create;
begin

end;

destructor TProdutoModel.destroy;
begin

  inherited;
end;

end.

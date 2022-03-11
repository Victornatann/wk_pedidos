unit ClienteModel;

interface

Type TClienteModel = class

private
    Fuf: String;
    Fcodigo: Integer;
    Fnome: String;
    Fcidade: String;

public

 property codigo: Integer read Fcodigo write Fcodigo;
    property nome: String read Fnome write Fnome;
    property cidade: String read Fcidade write Fcidade;
    property uf: String read Fuf write Fuf;

    constructor create;
    destructor destroy; override;

end;

implementation

{ TClienteModel }

constructor TClienteModel.create;
begin

end;

destructor TClienteModel.destroy;
begin

  inherited;
end;

end.

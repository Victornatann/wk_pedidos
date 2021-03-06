unit uConexaoFiredac;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt, FireDAC.Stan.ExprFuncs,
  FireDAC.FMXUI.Wait, FireDAC.Comp.Client, Data.DB,
  FireDAC.Stan.StorageJSON, FireDAC.Phys.SQLite,
  FireDAC.Comp.DataSet,
  FireDAC.Phys.FB, FireDAC.VCLUI.Wait,
  System.Classes;

type
{$TYPEINFO ON}
  TConexaoFiredac = class(TComponent)
  private
    FDriver: String;
    FDatabase: String;
    FOpenMode: String;
    FUsername: String;
    FPassword: String;
    FHost: String;
    FPorta: Integer;
    FManager: TFDManager;
    FDConnection: TFDConnection;

    constructor Create;
    function getConnection: TFDConnection;

    class var FInstancia: TConexaoFiredac;
  public
    function prepareStatement(const Value: String): TFDQuery;
    procedure closeConnection(Query: TFDQuery);
    procedure config(Drive, Database, Username, Password, Host: String;
      Porta: Integer);
    class function getInstancia: TConexaoFiredac;
  end;

implementation

uses
  System.SysUtils, uDm;

{ TConexaoFiredac }

procedure TConexaoFiredac.closeConnection(Query: TFDQuery);
begin
  try
    if (Assigned(Query)) then
    begin
      Query.Close;
      FreeAndNil(Query);

    end;
  except
    on E: Exception do
    begin
      raise Exception.Create('N?o foi poss?vel encerra a conex?o. Mensagem: ' +
        E.Message);
    end;
  end;
end;

procedure TConexaoFiredac.config(Drive, Database, Username, Password,
  Host: String; Porta: Integer);
var
  oParams: TStrings;
begin
  FDriver := Drive;
  FDatabase := Database;
  FHost := Host;
  FPorta := Porta;
  FUsername := Username;
  FPassword := Password;

  Dm.FConexao.Params.Add('DriverID=' + FDriver);
  Dm.FConexao.Params.Add('Server=' + FHost);
  Dm.FConexao.Params.Add('Port=' + inttostr(FPorta));
  Dm.FConexao.Params.Add('Database=' + FDatabase);
  Dm.FConexao.Params.Add('User_Name=' + FUsername);
  Dm.FConexao.Params.Add('Password=' + FPassword);
  Dm.FConexao.Connected := true;

end;

constructor TConexaoFiredac.Create;
begin

end;

function TConexaoFiredac.getConnection: TFDConnection;
begin
  try

    Result := Dm.FConexao;

  except
    on E: Exception do
    begin
      raise Exception.Create('N?o foi poss?vel criar a conex?o com ' +
        'o banco de dados. Mensagem Retornada: ' + E.Message);
    end;
  end;
end;

class function TConexaoFiredac.getInstancia: TConexaoFiredac;
begin
  if FInstancia = Nil then
    FInstancia := TConexaoFiredac.Create;

  Result := FInstancia;
end;

function TConexaoFiredac.prepareStatement(const Value: String): TFDQuery;
var
  Query: TFDQuery;

begin

  Query := TFDQuery.Create(Nil);
  Query.Connection := getConnection;
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Text := Value;
  Result := Query;
end;

end.

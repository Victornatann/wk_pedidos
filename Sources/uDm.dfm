object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 56
    Top = 88
  end
  object FConexao: TFDConnection
    Params.Strings = (
      'Database=db_wk'
      'User_Name=root'
      'Password=SiInteligente%$#@!1'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 56
    Top = 24
  end
end

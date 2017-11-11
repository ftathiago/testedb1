object DMConexao: TDMConexao
  OldCreateOrder = False
  Left = 365
  Top = 145
  Height = 365
  Width = 645
  object AvaliacaoDB1: TSQLConnection
    ConnectionName = 'AvaliacaoDB1'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=c:\FranciscoThiagoDeAlmeida\AvaliacaoDB1.fdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Left = 40
    Top = 16
  end
  object qryPesquisa: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = AvaliacaoDB1
    Left = 112
    Top = 16
  end
  object dspPesquisa: TDataSetProvider
    DataSet = qryPesquisa
    Options = [poDisableInserts, poDisableEdits, poDisableDeletes, poAllowCommandText]
    Left = 192
    Top = 16
  end
  object cdsPesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisa'
    Left = 272
    Top = 16
  end
end

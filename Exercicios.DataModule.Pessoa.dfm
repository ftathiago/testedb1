inherited dmPessoa: TdmPessoa
  OldCreateOrder = True
  Left = 479
  Top = 184
  inherited AvaliacaoDB1: TSQLConnection
    Connected = True
  end
  inherited qryPesquisa: TSQLDataSet
    AfterOpen = qryPesquisaAfterOpen
    CommandText = 
      'select PESSOA.CDPESSOA'#13#10'     , PESSOA.NMPESSOA'#13#10'     , PESSOA.DE' +
      'LOGRADOURO'#13#10'     , PESSOA.DEBAIRRO'#13#10'     , CIDADE.NMCIDADE'#13#10'from' +
      ' PESSOA'#13#10'  join CIDADE on CIDADE.CDCIDADE = PESSOA.CDCIDADE'#13#10'whe' +
      're PESSOA.NMPESSOA containing :NMPESSOA'
    Params = <
      item
        DataType = ftString
        Name = 'NMPESSOA'
        ParamType = ptInput
      end>
  end
  inherited cdsPesquisa: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'NMPESSOA'
        ParamType = ptInput
      end>
    AfterOpen = qryPesquisaAfterOpen
  end
  object PESSOA: TSQLDataSet
    CommandText = 
      'select PESSOA.CDPESSOA'#13#10'     , PESSOA.NMPESSOA'#13#10'     , PESSOA.DE' +
      'LOGRADOURO'#13#10'     , PESSOA.DEBAIRRO'#13#10'     , PESSOA.CDCIDADE'#13#10'    ' +
      ' , CIDADE.NMCIDADE'#13#10'from PESSOA'#13#10'  join CIDADE on CIDADE.CDCIDAD' +
      'E = PESSOA.CDCIDADE'#13#10'where CDPESSOA = :CDPESSOA'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CDPESSOA'
        ParamType = ptInput
      end>
    SQLConnection = AvaliacaoDB1
    Left = 48
    Top = 96
    object PESSOACDPESSOA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CDPESSOA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object PESSOANMPESSOA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NMPESSOA'
      Required = True
      Size = 100
    end
    object PESSOADELOGRADOURO: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'DELOGRADOURO'
      Size = 100
    end
    object PESSOADEBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'DEBAIRRO'
      Size = 100
    end
    object PESSOACDCIDADE: TIntegerField
      DisplayLabel = 'C'#243'd. Cidade'
      FieldName = 'CDCIDADE'
      Required = True
    end
    object PESSOANMCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'NMCIDADE'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object dspPessoa: TDataSetProvider
    DataSet = PESSOA
    Options = [poIncFieldProps]
    BeforeUpdateRecord = dspPessoaBeforeUpdateRecord
    Left = 48
    Top = 144
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CDPESSOA'
        ParamType = ptInput
      end>
    ProviderName = 'dspPessoa'
    AfterInsert = cdsPessoaAfterInsert
    AfterEdit = cdsPessoaAfterInsert
    AfterPost = cdsPessoaAfterPost
    AfterDelete = cdsPessoaAfterPost
    Left = 48
    Top = 192
    object cdsPessoaCDPESSOA: TIntegerField
      FieldName = 'CDPESSOA'
    end
    object cdsPessoaNMPESSOA: TStringField
      FieldName = 'NMPESSOA'
      Required = True
      Size = 100
    end
    object cdsPessoaDELOGRADOURO: TStringField
      FieldName = 'DELOGRADOURO'
      Size = 100
    end
    object cdsPessoaDEBAIRRO: TStringField
      FieldName = 'DEBAIRRO'
      Size = 100
    end
    object cdsPessoaCDCIDADE: TIntegerField
      FieldName = 'CDCIDADE'
      Required = True
    end
    object cdsPessoaNMCIDADE: TStringField
      FieldName = 'NMCIDADE'
      Required = True
      Size = 100
    end
  end
end

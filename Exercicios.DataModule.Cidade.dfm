inherited dmCidade: TdmCidade
  Left = 64470
  Top = 225
  inherited AvaliacaoDB1: TSQLConnection
    Connected = True
  end
  inherited qryPesquisa: TSQLDataSet
    CommandText = 'select CDCIDADE, NMCIDADE, UF from CIDADE'
  end
  inherited cdsPesquisa: TClientDataSet
    object cdsPesquisaCDCIDADE: TIntegerField
      FieldName = 'CDCIDADE'
      Required = True
      Visible = False
    end
    object cdsPesquisaNMCIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 50
      FieldName = 'NMCIDADE'
      Required = True
      Size = 100
    end
    object cdsPesquisaUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
  end
end

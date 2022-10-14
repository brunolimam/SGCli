json.array!(@customers) do |customer|
  json.extract! customer, :id, :razao, :iss, :cnpj, :cei, :cgf, :cod, :logradouro, :numero, :bairro, :complemento, :municipio, :estado, :telefone, :telefone2, :telefone3, :celular, :celular2, :email, :email2, :contato, :contato2, :endereco_coleta, :honorarios, :desde
  json.url customer_url(customer, format: :json)
end

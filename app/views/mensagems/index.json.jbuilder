json.array!(@mensagems) do |mensagem|
  json.extract! mensagem, :id, :conteudo, :autor
  json.url mensagem_url(mensagem, format: :json)
end

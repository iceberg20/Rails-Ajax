class CreateMensagems < ActiveRecord::Migration
  def change
    create_table :mensagems do |t|
      t.string :conteudo
      t.string :autor

      t.timestamps null: false
    end
  end
end

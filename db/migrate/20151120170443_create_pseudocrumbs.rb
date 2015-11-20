class CreatePseudocrumbs < ActiveRecord::Migration
  def change
    create_table :pseudocrumbs do |t|
      t.decimal :lat
      t.decimal :long
      t.string :identifier
      t.text :message

      t.timestamps null: false
    end
  end
end

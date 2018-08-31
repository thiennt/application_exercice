class InitTables < ActiveRecord::Migration[5.0]
  def change
    create_table :communes do |t|
      t.belongs_to :intercommunality, index: true
      t.string :name
      t.string :code_insee

      t.timestamps
    end

    create_table :intercommunalities do |t|
      t.string :name
      t.string :siren
      t.string :form

      t.timestamps
    end

    create_table :streets do |t|
      t.integer :title
      t.integer :from
      t.integer :to

      t.timestamps
    end

    create_table :commune_streets do |t|
      t.belongs_to :commune, index: true
      t.belongs_to :street, index: true

      t.timestamps
    end
  end
end
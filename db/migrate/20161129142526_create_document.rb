class CreateDocument < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.binary :data
      t.string :key
      t.timestamps
    end

    add_index :documents, :key, unique: true
  end
end

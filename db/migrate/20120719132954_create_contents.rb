class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :page_name
      t.text :body

      t.timestamps
    end
  end
end

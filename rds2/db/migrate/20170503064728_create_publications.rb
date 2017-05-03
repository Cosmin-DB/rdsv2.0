class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string :text
      t.date :date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

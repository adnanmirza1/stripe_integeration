class CreateCreateCaptainForms < ActiveRecord::Migration[6.1]
  def change
    create_table :captain_forms do |t|
      t.references :user, null: false, foreign_key: true
      t.text :detail

      t.timestamps
    end
  end
end

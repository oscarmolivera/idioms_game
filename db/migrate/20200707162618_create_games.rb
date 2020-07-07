class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :good_answers_count, default: 0
      t.integer :bad_answers_count, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end

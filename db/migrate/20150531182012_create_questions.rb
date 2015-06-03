class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :answer_type
      t.integer :survey_id
      t.text :label

      t.timestamps

    end
  end
end

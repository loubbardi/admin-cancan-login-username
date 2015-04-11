class CreateExercices < ActiveRecord::Migration
  def change
    create_table :exercices do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end

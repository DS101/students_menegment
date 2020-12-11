class AddPatronymicToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :patronymic, :string
  end
end

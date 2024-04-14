class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.string :fullname
      t.string :student_number
      t.string :document
      t.string :request_reason

      t.timestamps
    end
  end
end

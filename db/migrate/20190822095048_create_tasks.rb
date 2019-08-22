class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks, comment: 'タスクテーブル' do |t|
      t.string :title, comment: 'タイトル'
      t.text :description, comment: '説明'
      t.boolean :is_done, default: false, null: false, comment: '完了フラグ'

      t.timestamps
    end
  end
end

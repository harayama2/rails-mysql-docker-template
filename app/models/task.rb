# == Schema Information
#
# Table name: tasks
#
#  id                  :bigint           not null, primary key
#  description(説明)   :text(65535)
#  is_done(完了フラグ) :boolean          default(FALSE), not null
#  title(タイトル)     :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :bigint
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#

class Task < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }

  def done
    update(is_done: true)
  end

  def undo
    update(is_done: false)
  end
end

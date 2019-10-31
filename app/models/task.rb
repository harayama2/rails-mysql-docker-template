# == Schema Information
#
# Table name: tasks
#
#  id                  :bigint           not null, primary key
#  description(説明)   :text(65535)
#  due_date            :date
#  is_done(完了フラグ) :boolean          default(FALSE), not null
#  title(タイトル)     :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  assignee_id         :bigint
#  user_id             :bigint
#
# Indexes
#
#  index_tasks_on_assignee_id  (assignee_id)
#  index_tasks_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (assignee_id => users.id)
#

class Task < ApplicationRecord
  belongs_to :user
  belongs_to :assignee, class_name: 'User', optional: true
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }

  def done
    update(is_done: true)
  end

  def undo
    update(is_done: false)
  end
end

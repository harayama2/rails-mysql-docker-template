class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }

  def done
    update(is_done: true)
  end

  def undo
    update(is_done: false)
  end
end

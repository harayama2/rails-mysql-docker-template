class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }

  def done
    update(is_done: true)
  end

  def undo
    update(is_done: false)
  end
end

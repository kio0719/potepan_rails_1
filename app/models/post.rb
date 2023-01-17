class Post < ApplicationRecord
  validates :title,presence:true,length:{maximum: 20}
  validates :start_date,presence:true
  validates :end_date,presence:true
  validate :start_end_check
  validates :memo,length:{maximum: 500}

  def start_end_check
    if start_date && end_date
      errors.add(:end_date,"は開始日以降の日付を記入してください。") if self.start_date > self.end_date
    end
  end

end

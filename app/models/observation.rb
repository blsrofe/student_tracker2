class Observation < ApplicationRecord
  validates :comment, :date, :subject, :ob_type, presence: true

  belongs_to :student
  belongs_to :user

  def add_tone(raw_tone_data)
    tone_collection = raw_tone_data[:document_tone][:tones].first
    if tone_collection
      tone = tone_collection[:tone_name]
      update(tone: tone)
    end
  end
end

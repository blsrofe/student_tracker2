class Observation < ApplicationRecord
  validates :comment, :date, :subject, :ob_type, presence: true

  belongs_to :student
  belongs_to :user

  def add_tone(raw_tone_data)
    # tone_collection = raw_tone_data[:document_tone][:tones].first
    tone_collection = raw_tone_data[:document_tone][:tones].map do |tone_group|
      tone_group[:tone_name]
    end
    if tone_collection
      raw_tone = tone_collection.sort_by { |word| word.downcase }
      tone = raw_tone.join(", ")
      update(tone: tone)
    end
  end
end

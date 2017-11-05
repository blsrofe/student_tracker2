class ToneAnalyzer

  def self.find_tone(observation_id, comment)
    tone_data = WatsonService.find_tone(comment)
    observation = Observation.find(observation_id)
    observation.add_tone(tone_data)
  end


end

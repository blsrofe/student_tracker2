class WatsonService

  def initialize
    @conn = Faraday.new(url: "https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2017-09-21&sentences=false") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers["data-binary"] = "text/plain;charset=utf-8"
    end
    @conn.basic_auth("#{ENV["WATSON_USERNAME"]}", "#{ENV["WATSON_PASSWORD"]}")
  end

  def self.find_tone(comment)
    new.find_tone(comment)
  end

  def find_tone(comment)
    response = @conn.post do |req|
      req.headers['Content-Type'] = 'text/plain;charset=utf-8'
      req.body = comment
    end
    JSON.parse(response.body, symbolize_names: :true)
  end
end

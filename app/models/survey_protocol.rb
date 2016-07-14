class SurveyProtocol < ActiveRecord::Base
  has_many :observations, foreign_key: :protocol_id

  # generates CSV with all samples for this protocol
  def samples_to_csv

    CSV.generate do |csv|
      # column headers
      csv << ["site name"] + observations.first.samples.first.response_data.keys
      observations = self.observations.includes(:samples)
      # populate sample values
      observations.each do |observation|
        observation.samples.each do |sample|
          csv << [observation.site.name] + sample.response_data.values
        end
      end
    end

  end

end

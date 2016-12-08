class SurveyProtocol < ActiveRecord::Base
  has_many :observations, foreign_key: :protocol_id

  # generates CSV with all samples for this protocol
  def samples_to_csv

    CSV.generate do |csv|
      # column headers
      sample_headers = observations.first.sample_field_names
      csv << ["site name"] + sample_headers
      observations = self.observations.includes(:samples)
      # populate sample values
      observations.each do |observation|
        observation.samples.each do |sample|
          csv << [observation.site.name] + sample_headers.inject([]) do |m, k|
            m << sample.response_data[k]
            m
          end
        end
      end
    end

  end

end

class Observation < ActiveRecord::Base
  belongs_to :protocol, class_name: "SurveyProtocol"
  belongs_to :site
  has_many :samples

  # generates CSV with all samples for this observation
  def self.to_csv(obs_by_site)

    CSV.generate do |csv|
      obs_by_site.each do |site, observations|
        # site name
        csv << [site]
        # observations
        observations.each do |observation|
          csv << ["", "Observation", "#{observation.id}", "#{observation.date}"]
          # samples
          csv << ["", "", "Samples"]
          observation.samples.each_with_index do |sample, i|
            csv << ["", "", "id", "subsite_id"] + sample.response_data.keys if i == 0
            csv << ["", "", "#{sample.id}", "#{sample.subsite.id}"] + sample.response_data.values
          end
        end
      end
    end
  end

end

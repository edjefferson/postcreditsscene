class RealScene < ActiveRecord::Base
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names[0..1]
      all.each do |item|
        csv << item.attributes.values_at(*column_names[0..1])
      end
    end
  end

  def self.import(file)
    csv = CSV.open(file.path).read
    header = csv[0]
    csv[1..-1].each_with_index do |line, i|
      row = Hash[[header, csv[i]].transpose]
      scene = find_by_id(row["id"]) || new
      scene.imdb_id = line[1]
      scene.title = line[2]
      scene.text = line[3]
      scene.save!
    end
  end

end

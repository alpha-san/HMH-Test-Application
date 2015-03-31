class DataFile < ActiveRecord::Base
  def self.save(upload)
    name = upload['datafile'].original_filename
    directory = "public/data"

    # create file path
    path = File.join(directory, name)

    #write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }

    return path
  end
end

class DataFile < ActiveRecord::Base

  # Hash the name of the file with sha256
  def self.makeDirName(name)
    hash = Digest::SHA2.new(256).hexdigest(name)
    return hash
  end


  def self.save(upload)
    name =  upload['datafile'].original_filename
    dirName = makeDirName(name)
    directory = "public/files/#{dirName}"
    FileUtils.mkdir(directory)
    path = File.join(directory, name)
    if(!File.exist?(path))
      File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
      return path
    else
      return false
    end
  end

end

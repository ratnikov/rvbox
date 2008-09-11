
# Load the libraries
Dir.glob(File.dirname(__FILE__) + '/../lib/**/*.rb').each do |file|
  require file
end

# Load the source
Dir.glob(File.dirname(__FILE__) + '/../src/**/*.rb').each do |file|
  require file
end

require 'active_support/inflector'
require 'json'

task default: :build_readmes

def parse_tshirts_json
  file = open('tshirts.json')
  JSON.parse(file.read)
end

desc 'Create folders and READMEs for each shirt'
task :build_readmes do
  parsed = parse_tshirts_json
  parsed['tshirts'].each do |tshirt|
    p tshirt['name'].parameterize
  end
end

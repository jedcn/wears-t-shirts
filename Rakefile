require 'active_support/inflector'
require 'erb'
require 'fileutils'
require 'json'

def tshirt_slug(tshirt)
  tshirt['name'].parameterize
end

def tshirt_path(tshirt, file)
  if file
    "t/#{tshirt_slug(tshirt)}/#{file}"
  else
    "t/#{tshirt_slug(tshirt)}"
  end
end

def parse_and_process_json(file_name)
  file_contents = File.read(file_name)
  parsed_json = JSON.parse(file_contents)
  parsed_json['tshirts'].each do |tshirt|
    tshirt['readme_href'] = tshirt_path(tshirt, 'README.md')
    tshirt['image_url'] = "#{tshirt_slug(tshirt)}.png"
  end
  parsed_json
end

data = parse_and_process_json('./tshirts.json')
tshirts = data["tshirts"]

def create_erb_from_file(file_path)
  ERB.new(File.read(file_path), nil, '-')
end

def write_main_readme(tshirts)
  main_readme_erb = create_erb_from_file('templates/README.md.erb')
  rendered_template = main_readme_erb.result(binding)
  File.open('README.md', 'w') do |file|
    file.write(rendered_template)
  end
end

def create_tshirt_dir_and_readme(tshirt)
  tshirt_dir_name = tshirt['name'].parameterize
  puts tshirt_dir_name
  FileUtils.mkdir_p("t/#{tshirt_dir_name}")
  tshirt_readme_erb = create_erb_from_file('templates/T-SHIRT_README.md.erb')
  rendered_template = tshirt_readme_erb.result(binding)
  File.open("t/#{tshirt_dir_name}/README.md", 'w') do |file|
    file.write(rendered_template)
  end
end

desc 'Create main README and READMEs for each shirt'
task :build do
  write_main_readme(tshirts)
  tshirts.each do |tshirt|
    create_tshirt_dir_and_readme(tshirt)
  end
end

task default: :build

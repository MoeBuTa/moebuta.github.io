# require 'json'
# require 'pathname'
#
# module Jekyll
#   class ImagePathsGenerator < Generator
#     safe true
#
#     def generate(site)
#       # Directory where the images are located
#       image_directory = Pathname.new('assets/source/anime/image/header')
#
#       # Get a list of image file paths
#       image_paths = Dir.glob(image_directory.join('*')).map(&:to_s)
#
#       # Create a JSON file
#       json_file = site.in_source_dir('_data', 'image_paths.json')
#
#       # Create a hash with the image paths
#       image_data = { 'images' => image_paths }
#
#       # Write the hash to the JSON file
#       File.write(json_file, JSON.pretty_generate(image_data))
#
#       puts "JSON file 'image_paths.json' created successfully."
#     end
#   end
# end
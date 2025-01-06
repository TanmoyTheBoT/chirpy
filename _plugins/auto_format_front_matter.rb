# Directory containing the post files
post_folder = './_posts'  # Using the _posts folder

# Iterate over all files in the folder
Dir.glob("#{post_folder}/**/*.md") do |file|
  # Read the content of the file
  content = File.read(file)

  # Change "categories" line: Replace quotes and commas with list format
  content.gsub!(/categories:\s*"(.*?)"/) do |match|
    categories = $1.split(',').map(&:strip).join(', ')  # Split, remove extra spaces, and join back
    "categories: [#{categories}]"
  end

  # Change "tags" line: Replace quotes and commas with list format
  content.gsub!(/tags:\s*"(.*?)"/) do |match|
    tags = $1.split(',').map(&:strip).join(', ')  # Split, remove extra spaces, and join back
    "tags: [#{tags}]"
  end

  # Write the updated content back to the file
  File.write(file, content)

  puts "Updated: #{file}"
end

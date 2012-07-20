require "erb2haml_cli/version"
# Taken and modified from https://github.com/dhl/erb2haml

module Erb2hamlCli
  require 'find'

  RED_FG ="\033[31m"
  GREEN_FG = "\033[32m"
  END_TEXT_STYLE = "\033[0m"

  # Helper method to inject ASCII escape sequences for colorized output
  def self.color(text, begin_text_style)
    begin_text_style + text + END_TEXT_STYLE
  end

  def self.run(argv)
    return usage if argv.grep(/--help/)

    if `which html2haml`.empty?
      puts "#{color "ERROR: ", RED_FG} Could not find " +
         "#{color "html2haml", GREEN_FG} in your PATH. Aborting."
    end

    dir = argv.first || "."
    unless FileTest.directory?(dir)
      $stderr.puts "#{dir} is not a directory"
      exit 1
    end

    puts "Looking for #{color "ERB", GREEN_FG} files to convert to " +
      "#{color("Haml", RED_FG)}..."

    Find.find(dir) do |path|
      if FileTest.file?(path) and path.downcase.match(/\.erb$/i)
        haml_path = path.gsub("erb", "haml")

        unless FileTest.exists?(haml_path)
          print "Converting: #{path}... "

          if system("html2haml", "--erb", "--unix-newlines", path, haml_path)
            puts color("Done!", GREEN_FG)
          else
            puts color("Failed!", RED_FG)
          end
        end
      end
    end
  end # self.run

  def self.usage
    puts <<-DOC
#{$0} [PATH]
Convert all *.erb files in directory PATH. Using current working directory if not set.
DOC
  end
end # Erb2hamlCli

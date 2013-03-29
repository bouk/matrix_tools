require "matrix"

Dir[File.dirname(__FILE__) + '/matrix_tools/*.rb'].each {|file| require file }

module MatrixTools
  VERSION = "0.0.1"
end

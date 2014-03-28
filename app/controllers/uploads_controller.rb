class UploadsController < ApplicationController
  def index
  end
  
require 'csv'

class Upload
  def initialize(file)
    @uploaded_file = params[:file]
    Assignment.import(@uploaded_file)
  end
end

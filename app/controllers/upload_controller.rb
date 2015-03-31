
class UploadController < ApplicationController
  def index
    render :file => "/app/views/upload/uploadfile.rhtml"
  end

  def uploadFile
    post = DataFile.save(params[:upload])

    file_name = './' + post

    use_case = UseCase.new
    data = SpreadsheetImporter.new(use_case, file_name)

    render :text => "File has been uploaded successfully"
  end
end

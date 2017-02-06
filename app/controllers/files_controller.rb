class FilesController < ApplicationController


  def show
    params.permit!
    file_name = params[:id]

    file = File.open("#{Rails.root}/app/assets/images/#{file_name}.png")

    send_file file
  end


end

class MainsController < ApplicationController
  protect_from_forgery with: :exception

  ENDPOINTS= ['main', 'client', 'frontline', 'mm', 'server', 'unix']

  ENDPOINTS.each do |endpoint_name|
    define_method endpoint_name.to_sym do
      @dir_name = endpoint_name

      load_raw_image_files
      load_url_files

      respond_to do |format|
        format.html{
          render "main"
        }
      end
    end
  end

  def load_url_files
    @urls = []
    file = IO.readlines("#{Rails.root}/app/assets/images/#{@dir_name}/file_urls.txt").each do |line|
      @urls << line.chomp
    end
  end

  def load_raw_image_files
    #always include main images, then load other images unless its the 
    #main action
    raw_files = Dir[ "#{Rails.root}/app/assets/images/main/*.png" ]
    unless @dir_name == 'main'
      raw_files += Dir[ "#{Rails.root}/app/assets/images/#{@dir_name}/*.png" ]
    end
    #change sort algorithm below to change load order, not as simple as it sounds
    @files = raw_files.flatten.map{|file| file.split('/').last(2).join('/')}.sort
    @first_file = @files.shift
  end

end

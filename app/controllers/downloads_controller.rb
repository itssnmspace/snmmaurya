class DownloadsController < ApplicationController
  def index
    @downloads = Download.all
  end
  

  def downloader
    filename =  "#{Time.new.to_i.to_s}.csv"
    download = Download.create(title: "users##{filename}", download: filename, description: "None", category: "users")
    UserDownloadWorker.perform_async({download_id: download.id})
    flash[:success] = "You can download your file here as just got ready for download"
    redirect_to downloads_path
  end
end
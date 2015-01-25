class DataFileController < ApplicationController

  def uploadFile
    if(params.has_key?(:upload))
      url = DataFile.save(params[:upload])
      email = params["email"]
      if(url != false && !email["cimzett"].blank?)
        recipient = email["cimzett"]
        @subject = email["targy"]
        @message = email["uzenet"]
        @from = email["felado"]
        @url = url.from(7)

        if(@from.blank?)
          @from = false
        end

        if(@message.blank?)
          @message = false
        end

        if(@subject.blank?)
          @subject = "RubyTold fajl erkezett!"
        end

        Emailer.mailto(recipient, @url, @subject, @message, @from).deliver
        # levágjuk a public -ot
        # marad: files/generálthash/fájlnév
        render "success"
      else
        render "fail"
      end
    else
      render "fail"
    end
  end

  def setDownloadLink
    name = params[:url]
    @url = name
    render "success"
  end

end

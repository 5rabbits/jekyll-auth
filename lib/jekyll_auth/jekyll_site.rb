class JekyllAuth
  class JekyllSite < Sinatra::Base

    register Sinatra::Index
    set :public_folder, File.expand_path('_book', Dir.pwd)
    use_static_index 'index.html'

    not_found do
      status 404
      four_oh_four = File.expand_path('_book/404.html', Dir.pwd)
      File.read(four_oh_four) if File.exists?(four_oh_four)
    end
  end
end

module Sinatra
  module App
    module Helpers
      def require_logged_in
        redirect '/' if session[:account_id].nil?
      end
    end
  end
end
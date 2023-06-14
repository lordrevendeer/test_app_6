class StatController < ActionController::Base

    def new
        @stat = Stat.new 
    end  

end
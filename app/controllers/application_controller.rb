class ApplicationController < ActionController::Base
    def hello
        render html: "hello, world!_toy"
    end

    def index
        @users = User.all
    end
end

class ApplicationController < ActionController::Base
    def hello
        render html: "hello, world!_toy"
    end
end

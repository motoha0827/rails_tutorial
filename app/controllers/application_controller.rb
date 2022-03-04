class ApplicationController < ActionController::Base
    def hello
        render html: "¡Hola, world!"
    end

    def goodbye
        render html: "goodbye, world!testtest"
    end
end

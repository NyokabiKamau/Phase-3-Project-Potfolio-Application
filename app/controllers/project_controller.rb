class ProjectController < AppController

    # @method: Display a small welcome message
    get '/hello' do
        "Hello, Welcome"
    end

    # @helper: format body data
    def data(create: false)
        payload = JSON.parse(request.body.read)
        if create
            payload["createdAt"] = Time.now
        end
        payload
    end

 

  
end
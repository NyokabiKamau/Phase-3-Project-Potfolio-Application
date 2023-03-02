class ProjectController < AppController

    # @method: Display a small welcome message
    get '/hello' do
        "Hello, Welcome"
    end

    # @method: Add a new Project to the DB
    post '/projects/create' do
        begin
            project = Project.create( self.data(create: true) )
            json_response(code: 201, data: project)
        rescue => e
            json_response(code: 422, data: { error: e.message })
        end
    end

    # @method: Display all projects
    get '/projects' do
        project = Project.all
        project.to_json
    end

    


    private

    # @helper: format body data
    def data(create: false)
    payload = JSON.parse(request.body.read)
    if create
        payload["createdAt"] = Time.now
    end
    payload
    end



end
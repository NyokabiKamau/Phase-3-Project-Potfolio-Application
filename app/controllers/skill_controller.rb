class SkillController < AppController

    # @method: Add a new Skill to the DB
    post '/skills/create' do
        begin
            skill = Skill.create( self.data(create: true) )
            json_response(code: 201, data: skill)
        rescue => e
            json_response(code: 422, data: { error: e.message })
        end
    end

    # @method: Display all Skills
    get '/skills' do
        skill = Skill.all
        skill.to_json
    end    

    # @view: Renders an erb file which shows all Skills
    # erb has content_type because we want to override the default set above
    get '/' do
        @skills = Skill.all.map { |skill|
          {
            skill: skill,
            badge: skill_status_badge(skill.status)
          }
        }
        @i = 1
        erb_response :skill
    end

    # @method: Update existing skill according to :id
    put '/skills/update/:id' do
        begin
            skill = Skill.find(self.skill_id)
            skill.update(self.data)
            json_response(data: { message: "skill updated successfully" })
        rescue => e
            json_response(code: 422 ,data: { error: e.message })
        end
    end

    # @method: Delete skill based on :id
    delete '/skills/destroy/:id' do
        begin
            skill = Skill.find(self.skill_id)
            skill.destroy
            json_response(data: { message: "skill deleted successfully" })
        rescue => e
          json_response(code: 422, data: { error: e.message })
        end
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


    # @helper: retrieve to-do :id
    def skill_id
        params['id'].to_i
    end

    # @helper: format status style
    def skill_status_badge(status)
        case status
            when 'CREATED'
                'bg-info'
            when 'ONGOING'
                'bg-success'
            when 'CANCELLED'
                'bg-primary'
            when 'COMPLETED'
                'bg-warning'
            else
                'bg-dark'
        end
    end


end
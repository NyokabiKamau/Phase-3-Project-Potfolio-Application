class UserController < AppController

    # @helper: read JSON body
    before do
      begin
        @user = user_data
      rescue
        @user = nil
      end
    end
  
    post '/auth/register' do
      begin
        x = User.create(@user)
        json_response(code: 201, data: x)
      rescue => e
        error_response(422, e)
      end
    end
  
    #@method: log in user using email and password
    post '/auth/login' do
      begin
        user_data = User.find_by(email: @user['email'])
        if user_data.password_hash == @user['password_hash']
          json_response(code: 200, data: {
            id: user_data.id,
            email: user_data.email
          })
        else
          json_response(code: 422, data: { message: "Your email/password combination is not correct" })
        end
      rescue => e
        error_response(422, e)
      end
    end

    # @method: Display all skills from user with a limit of 10
    get '/user-skills/:id' do
      user_skills = User.find(self.user_id).skills.all
      user_skills.limit(10).to_json
    end  

   # @method: Display all projects from user
   get '/user-projects/:id' do
    project_skill = User.find(self.user_id).projects.all
    project_skill.to_json
    end  

    # @method: Display all Users
    get '/users' do
      user = User.all
      user.to_json
    end  
  
    private
  
    # @helper: parse user JSON data
    def user_data
      JSON.parse(request.body.read)
    end

     # @helper: retrieve project :id
     def user_id
      params['id'].to_i
  end
  
  end
  
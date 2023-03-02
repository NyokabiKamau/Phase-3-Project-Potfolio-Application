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
  
    private
  
    # @helper: parse user JSON data
    def user_data
      JSON.parse(request.body.read)
    end
  
  end
  
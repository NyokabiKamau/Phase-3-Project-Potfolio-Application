class UserController < AppController

    # @helper: read JSON body
    before do
      begin
        @user = user_data
      rescue
        @user = nil
      end
    end
  
  
  end
  
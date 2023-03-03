class User < ActiveRecord::Base
    has_many :skills
    has_many :projects
    # table consists of password_hash as a column to store password hashes in DB
    include BCrypt
  
    # retrieve password from hash
    def password
      @password ||= Password.new(password_hash)
    end
  
    # create the password hash
    def password=(new_pass)
      @password = Password.create(new_pass)
      self.password_hash = @password
    end

    def skill_s
      self.skills
    end
  
    def skill_count
      skill_s.count
    end
  end
  
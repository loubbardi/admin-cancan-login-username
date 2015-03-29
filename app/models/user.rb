class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles
  has_and_belongs_to_many :dossiers

	attr_accessor :login
	
	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
		else
			where(conditions).first
		end
	end
	
	

	before_save :setup_role	
		#---- definition du role de l'utilisateur a la creation et a l'edition
		def role?(role)
      			return !!self.roles.find_by_name(role.to_s.camelize)
  		end 
		
		def setup_role 
    			if self.role_ids.empty?     
     				 self.role_ids = [3]
    			end
 		 end		
	#-----validation des données
	validates :email, :uniqueness => true
	validates :username, presence: true, length: {maximum: 255}, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "may only contain letters and numbers." }
end

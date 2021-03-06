class Customer < ActiveRecord::Base
	self.per_page = 5
	
	

	validates :razao, presence: true, uniqueness: true
	# validates :municipio,:estado, presence: true
	# validates :cnpj,:iss,presence: true
	# validates :cnpj,{length: { is: 14 },uniqueness: true, numericality: true,if: 'cnpj.present?'}
	# validates :iss,{length: { is: 14 },uniqueness: true, numericality: true,if: 'iss.present?'}




	def address
		if municipio.present?
			"#{logradouro}, #{numero} #{complemento} #{bairro} - #{municipio}-#{estado}"		
		elsif estado.present?
			"#{logradouro}, #{numero} #{complemento} #{bairro}"
		else
			"#{logradouro}, #{numero} #{complemento} #{bairro}"
		end
	end

	def phone_numbers
		"#{telefone} #{telefone2} #{telefone3}"
	end

	def mobilephone_numbers
		"#{celular} #{celular2}"
	end	

	def mail
		"#{email} #{email2}"		
	end

	def since
		"#{desde.strftime("%d/%m/%Y")}"
	end

	def get_cnpj
		cnpj.sub(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/, "\\1.\\2.\\3/\\4-\\2") if cnpj.present?# ==> 69.103.604/0001-60
	end

end

class Mailer 
	require 'postmark'
  @queue = :mail  
  def self.perform(content, employee)	
  	
  	Postmark::ApiClient.new('efc0dfeb-6f9c-41b4-8789-f2794c71e93f', http_open_timeout: 15).deliver(from: 'vishnukulangara@qburst.com', to: employee, subject: "Newsletter" , html_body: "#{content}", text_body: "#{content}")    
  	
  end
end

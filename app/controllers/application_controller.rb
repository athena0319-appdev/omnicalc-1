class ApplicationController < ActionController::Base

def blank_square_form
  render({:template=>"calculation_templates/square_form.html.erb"})
end

def calculate_square
  @nums = params.fetch("elephant").to_f
  @square_of_num= @nums*@nums
  render({:template=>"calculation_templates/square_results.html.erb"})
end
 

 def root_form
    render({:template=>"calculation_templates/root_form.html.erb"})
  end

  def calculate_root
    @nums = params.fetch("elephant").to_f
    @root_of_num= Math.sqrt(@nums)
    render({:template=>"calculation_templates/root_results.html.erb"})
  end 

 def random_form
      render({:template=>"calculation_templates/random_form.html.erb"})
  end
  
  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = @lower + rand() * (@upper - @lower)
    render({:template=>"calculation_templates/rand_results.html.erb"})
  end
  
  def payment_form
      render({:template=>"calculation_templates/payment_form.html.erb"})
  end
  
  def calculate_payment
    @APR = params.fetch("apr").to_f
    @number_of_years = params.fetch("years").to_f
    @principal = params.fetch("principal").to_f
    # Calculate the payment here (replace the next line with your calculation)
    monthly_interest_rate = @APR / (100 * 12)
    number_of_payments = @number_of_years * 12

@payment = @principal * (monthly_interest_rate * (1 + monthly_interest_rate)**number_of_payments) / ((1 + monthly_interest_rate)**number_of_payments - 1)
    render({:template=>"calculation_templates/payment_results.html.erb"})
  end


end

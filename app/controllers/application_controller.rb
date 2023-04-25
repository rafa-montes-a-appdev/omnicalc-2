class ApplicationController < ActionController::Base

  def add_blank

   render({:template => "/calculations/add_form.html.erb"})
  end

  def add_calc
    @first = params.fetch(:first_num).to_f
    @second = params.fetch(:second_num).to_f
    @result = @first + @second

    render({:template => "/calculations/add_results.html.erb"})
   end


   def subtract_blank

    render({:template => "/calculations/subtract_form.html.erb"})
   end

   def subtract_calc
    @first = params.fetch(:first_num).to_f
    @second = params.fetch(:second_num).to_f
    @result = @first - @second
    render({:template => "/calculations/subtract_results.html.erb"})
   end

   def multiply_blank

    render({:template => "/calculations/multiply_form.html.erb"})
   end

   def multiply_calc
    @first = params.fetch(:first_num).to_f
    @second = params.fetch(:second_num).to_f
    @result = @first * @second
    render({:template => "/calculations/multiply_results.html.erb"})
   end

   def divide_blank

    render({:template => "/calculations/divide_form.html.erb"})
   end

   def divide_calc
    @first = params.fetch(:first_num).to_f
    @second = params.fetch(:second_num).to_f
    @result = @first / @second
    render({:template => "/calculations/divide_results.html.erb"})
   end

end

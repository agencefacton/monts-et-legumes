class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @next_selling_range = SellingRange.next
  end

  def wait
    @next_selling_range = SellingRange.next
  end
end

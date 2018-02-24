require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
    
    test "should get home" do 
    get pages_home_url
    assert responce :success 
    end
    test "should get root" do 
        get root_url
        assert responce :success
     end

end

require_relative 'classes.rb'
require 'test/unit'
    require "json"

class TestProduct< Test::Unit::TestCase
    def test_as_json 
        assert_equal(
        "{\
\"name\":\"name\",\"count\":2,\"description\":\"dess\",\"category\":\"catt\"\
}",JSON.dump(Product.new("name", 2, "dess", "catt")))
    end
end

require_relative 'ItemRepository.rb'
require_relative 'Product.rb'
require 'test/unit'

class TestItemRepository < Test::Unit::TestCase
    def test_add_to_existing
        repo = ItemRepository.new []
        repo.add Product.new("exsting", 2, "descr", "cat")
        repo.add Product.new("name", 2, "descr", "cat")
        assert_equal(Product.new("name", 2, "descr", "cat"), repo.get_all.last)
    end
    def test_add
        repo = ItemRepository.new []
        repo.add Product.new("name", 2, "descr", "cat")
        assert_equal(Product.new("name", 2, "descr", "cat"), repo.get_all.first)
    end
    def test_get_all
        repo = ItemRepository.new []
        first = Product.new("exsting", 2, "descr", "cat")
        repo.add first 
        second = Product.new("name", 2, "descr", "cat")
        repo.add second
        assert_equal([first, second], repo.get_all)
    end
    def test_find_by_name
        repo = ItemRepository.new []
        first = Product.new("exsting", 2, "descr", "cat")
        repo.add first 
        
        assert_equal(first, repo.find_by_name("exsting"))
    end
    def test_nil_if_not_found
        repo = ItemRepository.new []
        assert_nil(repo.find_by_name "not present")
    end
    def test_delete
        repo = ItemRepository.new []
        first = Product.new("exsting", 2, "descr", "cat")
        repo.add first 

        repo.remove first
        assert_equal 0, repo.get_all.count
    end
end

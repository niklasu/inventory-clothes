require_relative 'classes.rb'
require 'test/unit'

class TestItemRepository < Test::Unit::TestCase
    def test_add_to_existing
        repo = ItemRepository.new []
        repo.add Product.new("exsting", 2, "descr", "cat")
        repo.add Product.new("name", 2, "descr", "cat")
        assert_equal(Product.new("name", 2, "descr", "cat"), repo.getAll.last)
    end
    def test_add
        repo = ItemRepository.new []
        repo.add Product.new("name", 2, "descr", "cat")
        assert_equal(Product.new("name", 2, "descr", "cat"), repo.getAll.first)
    end
    def test_getAll
        repo = ItemRepository.new []
        first = Product.new("exsting", 2, "descr", "cat")
        repo.add first 
        second = Product.new("name", 2, "descr", "cat")
        repo.add second
        assert_equal([first, second], repo.getAll)
    end
    def test_findByName
        repo = ItemRepository.new []
        first = Product.new("exsting", 2, "descr", "cat")
        repo.add first 
        
        assert_equal(first, repo.findByName("exsting"))
    end
    def test_nil_if_not_found
        repo = ItemRepository.new []
        assert_nil(repo.findByName "not present")
    end
    def test_delete
        repo = ItemRepository.new []
        first = Product.new("exsting", 2, "descr", "cat")
        repo.add first 

        repo.remove first
        assert_equal 0, repo.getAll.count
    end
end

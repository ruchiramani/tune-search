require 'test_helper'

class SearchServiceTest < ActiveSupport::TestCase
  test 'it creates a  general search' do
    search_term = 'Drake'
    search = SearchService.new(search_term).general_search
    assert search
  end

  test 'it creates a search with artist name' do
    params = {
      'artist' => 'adele',
      'song' => 'hello',
      'album' => ''
    }
    search = SearchService.new(params).term_search
    assert search
  end
end

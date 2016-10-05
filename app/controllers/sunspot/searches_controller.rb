class Sunspot::SearchesController < ApplicationController
  def index
    @search = SunspotPost.solr_search do
      fulltext params[:search]

      with :user_id, params[:user_id] if params[:user_id].present?
      with :featured, params[:featured] if params[:featured].present?

      paginate :page => (params[:page] || 1), :per_page => 2  #=> per_page also works for limit query

      order_by :created_at, :desc
    end
    @searches = @search.results
  end

  def advance_search
    render layout: false
  end
end


=begin
#=====================================================================#
fulltext search:

#Fetch all posts and comments (title, description) of posts and description of comments having text apple
fulltext "apple"


#score higher if apple text found in title
fulltext "apple" do
  boost_fields :title => 2.0
end


#posts with apple score higher if featured
fulltext "apple" do
  boost(2.0) {with(:featured, true)}
end


#Boost if apple found in description and not boost in found in title
fulltext "apple" do
  fields(:description => 2.0, :title)
end  
#=====================================================================#
#=====================================================================#


#=====================================================================#
#=====================================================================#
Phrases search
Solr allows searching for phrases: search terms that are close together.


#posts with exact phrase/text
fulltext "apple fruit"

#'query_phrase_slop' method sets the number of words that may appear between the words in a phrase
fulltext "apple fruit" do
  query_phrase_slop 2
end
#can search for - apple is a fruit, apple is not fruit and so on as well as apple fruit
#=====================================================================#
#=====================================================================#


#=====================================================================#
#=====================================================================#
Scoping (Scalar Fields)
Fields of type integer, boolean and so on can be used as scope/restrict query before full text search


Positive Condition
with(:user_id, 1)
with(:average => 0..4)
with(:created_at).greater_than(1.month.ago)
with(:category_ids, [1,2,3,4,5])

Negatice Condition
without(:category_ids, [1,2,3,4,5])


Restric fields in results: will return only two fields title and descrciption
field_list [:title, :descrciption]
#=====================================================================#
#=====================================================================#


#=====================================================================#
#=====================================================================#
Pagination All results from Solr are paginated
In the controller you can define Pagination parameters

paginate :page => 2, :per_page => 15

some available methods related to pagination

search.tota
results.total_pages
results.first_page?
results.last_page?
results.previous_page
results.next_page
results.out_of_bounds?
results.offset
#=====================================================================#
#=====================================================================#


#=====================================================================#
#=====================================================================#
group by used to group elements in query

group :post_category_id

limit is used for grouping sunspot provides paginate method to limit results
paginate page: 2, per_page: 10     ===> means limit is 2
Facet: 
#=====================================================================#
#=====================================================================#

#=====================================================================#
#=====================================================================#
#=====================================================================#
#=====================================================================#
#=====================================================================#
#=====================================================================#

#=====================================================================#
=end
require 'data_mapper'
require 'sinatra'
# require 'pg'
require 'dm-migrations'

DataMapper::setup(:default, 'postgres://akumar:@localhost:5432/balist')

# Classes
class ListItem 
	include DataMapper::Resource
	property :itemid, Serial, :key => true 
	property :lefthand, Boolean
	property :header, String
	property :comment, Text
	property :createdDate, DateTime
	property :revisionDate, DateTime
	belongs_to :list
end
class List
	include DataMapper::Resource
	property :listID, Serial, :key => true
	property :listName, String, :required => true
	property :lefthand, String
	property :righthand, String
	property :createdDate, DateTime
	property :revisionDate, DateTime
	has n, :listItems
	belongs_to :user
end

class User
	include DataMapper::Resource
	property :uid, Serial, :key => true
	property :firstname, String
	property :lastname, String
	property :email, String
	has n, :lists
end
DataMapper.finalize.auto_upgrade!

# Methods

# def openSql()
# 	conn = PG.connect(:host => 'localhost', :dbname => 'balist', :user => 'akumar', :password => nil)	
# 	return conn
# end

def getListInfo(listid)
	return Lists.all(:list_id => listid).last()
end

def getListItems(listid, lefthand)
	return	ListItem.all(:list_list_id => listid, :lefthand => lefthand)
end

def getLists(uid)
	return List.all(:user_uid => uid)
end

# Views 

get '/' do 	
	erb :index
end

get '/lists/new' do
	@allLists = getLists(2)
	erb :newList
end

get '/lists/:listid' do 
	@allLists = getLists(2)
	@listInfo = getListInfo(params[:listid])
	erb 
end



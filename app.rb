require 'data_mapper'
require 'sinatra'
# require 'pg'
require 'dm-migrations'

DataMapper::setup(:default, 'postgres://akumar:@localhost:5432/balist')

#DataMapper::setup(:default,'postgres://xejwmmcrykifwk:jGHaax-hXNmkSsRdmFEgHqf-EX@ec2-54-243-180-54.compute-1.amazonaws.com:5432/dd0v7igsu1nu5l')

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
	logger.info "getListInfo"
	return List.all(:listID => listid).last()
end

def getListItems(listid, lefthand)
	logger.info(["getListItems", listid, lefthand])
	return	ListItem.all(:list => {:listID => listid}, :lefthand => lefthand)
end

def getLists(uid)
	logger.info(["getLists",uid])
	return List.all(:user => {:uid => uid})
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
	logger.info "Request Made"
	@allLists = getLists(2)
	@currentList = getListInfo(params[:listid])
	@leftList = getListItems(params[:listid],true)
	@rightList = getListItems(params[:listid],false)
	erb :list
end

post '/lists/new' do
	l = List.new()
	l.listName = params[:NewListTitle]
	l.lefthand = params[:newLeftHand]
	l.righthand = params[:newRightHand]
	l.createdDate = Time.now
	l.revisionDate = Time.now
	l.user = User.all(:uid => 2).last()
	l.save
	redirect "/lists/#{l.listID}"
end
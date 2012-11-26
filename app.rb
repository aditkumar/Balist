require 'data_mapper'
require 'sinatra'
# require 'pg'

DataMapper::setup(:default, 'postgres://akumar:@localhost:5432/balist')

# Classes
class ListItem 
	include DataMapper::Resource
	property :itemid, Serial, :key => true 
	property :listID, Integer, :required => true
	property :lefthand, Boolean
	property :header, String
	property :comment, Text
	property :createdDate, DateTime
	property :revisionDate, DateTime
end
class List
	include DataMapper::Resource
	property :uid, Integer, :required => true
	property :listID, Serial, :key => true
	property :listName, String, :required => true
	property :lefthand, String
	property :righthand, String
	property :createdDate, DateTime
	property :revisionDate, DateTime
end
class User
	include DataMapper::Resource
	property uid, Serial, :key => true
	property firstname, String
	property lastname, String
	property email, String
end

# Methods
# def openSql()
# 	conn = PG.connect(:host => 'localhost', :dbname => 'balist', :user => 'akumar', :password => nil)	
# 	return conn
# end

def getListInfo(listid)
	conn = openSql()
	res = conn.exec('SELECT listname, lefthand, righthand from balist.lists where listid=$1', [listid])
	conn.close
	if res.num_tuples == 1
		return res[0]
	else
		return nil
	end
end

def getListItems(listid, lefthand)
	conn = openSql()
	res = conn.exec('SELECT * from balist.listitems where listid=$1 and lefthand=$2', [listid,lefthand])
	conn.close

	if res.num_tuples > 0
		return res
	else
		return nil
	end
end

def getLists(uid)
	conn = openSql()
	res = conn.exec('SELECT listid, listname from balist.lists where uid=$1 order by listname asc', [uid])
	conn.close
	if res.num_tuples > 0
		return res
	else
		return nil
	end
end

# Views 

get '/' do 	
	erb :index
end

get '/lists/new' do
	allLists = getLists(2)
	erb :newList, :locals => {:allLists => allLists}
end

get '/lists/:listid' do 
	allLists = getLists(2)
	listInfo = getListInfo(params[:listid])
	state = {:listName => listInfo['listname'], :lListName => listInfo['lefthand'], :rListName => listInfo['righthand'], :leftList => getListItems(params[:listid],true) , :rightList => getListItems(params[:listid],false) }
	erb :list, :locals => { :listState => state, :allLists => allLists}
end



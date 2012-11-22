require 'sinatra'
require 'pg'

def getListInfo(listid)
	conn = PG.connect(:host => 'localhost', :dbname => 'balist', :user => 'akumar', :password => nil)
	res = conn.exec('SELECT listname, lefthand, righthand from balist.lists where listid=$1', [listid])
	conn.close
	if res.num_tuples == 1
		return res[0]
	else
		return nil
	end
end

def getListItems(listid, lefthand)
	conn = PG.connect(:host => 'localhost', :dbname => 'balist', :user => 'akumar', :password => nil)
	res = conn.exec('SELECT * from balist.listitems where listid=$1 and lefthand=$2', [listid,lefthand])
	conn.close

	if res.num_tuples > 0
		return res
	else
		return nil
	end
end

def getLists(uid)
	conn = PG.connect(:host => 'localhost', :dbname => 'balist', :user => 'akumar', :password => nil)
	res = conn.exec('SELECT listid, listname from balist.lists where uid=$1 order by listname asc', [uid])
	conn.close
	if res.num_tuples > 0
		return res
	else
		return nil
	end
end

get '/' do 	
	erb :index
end

get '/list/:listid' do 
	allLists = getLists(2)
	listInfo = getListInfo(params[:listid])
	state = {:listName => listInfo['listname'], :lListName => listInfo['lefthand'], :rListName => listInfo['righthand'], :leftList => getListItems(1,true) , :rightList => getListItems(1,false) }
	erb :list, :locals => { :listState => state, :allLists => allLists}
end
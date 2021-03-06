require 'pg'

def openSql()
	conn = PG.connect(:host => 'localhost', :dbname => 'balist', :user => 'akumar', :password => nil)	
	return conn
end

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
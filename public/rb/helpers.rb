require 'pg'

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
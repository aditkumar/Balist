create schema balist;

create table balist.users (uid serial primary key,
					firstname varchar(255),
					lastname varchar(255),
					email varchar(255)
					);

create table balist.lists (listID serial primary key,
					uid int not null,
					listName varchar(255),
					lefthand varchar(255),
					righthand varchar(255),
					creationDate timeStamp,
					revisionDate timeStamp
					);

create table balist.listItems (itemID serial primary key,
						listID int,
						lefthand boolean,
						header varchar(255),
						comment varchar(255),
						createdDate timestamp,
						revisionDate timestamp
						);

insert into balist.users (firstname, lastname, email) values ('Adit','Kumar','aditkumar@gmail.com');
insert into balist.users (firstname, lastname, email) values ('Barry','McCardel','barrald1213@gmail.com');
insert into balist.lists (listID, listName, lefthand, righthand, uid) values (DEFAULT,'Dallas Restaurants','Eaten','Uneaten', 2)

copy balist.listItems (listid,lefthand,header,comment) from '/Users/akumar/Documents/Scratch/Balist/listItems.csv' delimiter as ',' csv header
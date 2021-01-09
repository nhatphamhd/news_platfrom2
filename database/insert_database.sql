set search_path to news_platform;

insert into role(code,name) values('MANAGER','Quản trị hệ thống');
insert into role(code,name) values('USER','người dùng');

insert into users (username,password,fullname,status)
values('MANAGER','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','PVN',1);

insert into users (username,password,fullname,status)
values('User','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG','AAA',2);
INSERT INTO user_role(user_id,role_id) VALUES (1,1);
INSERT INTO user_role(user_id,role_id) VALUES (2,2);

insert into new (code,thumbnail,title,content,shortDescription)
values('NEWS SPORT1','img1','bản tin thể thao1', 'bản tin thể thao1','bản tin thể thao1');

insert into new (code,thumbnail,title,content,shortDescription)
values('NEWS SPORT2','img2','bản tin thể thao2', 'bản tin thể thao2','bản tin thể thao2');
insert into new (code,thumbnail,title,content,shortDescription)
values('NEWS SPORT3','img3','bản tin thể thao3', 'bản tin thể thao3','bản tin thể thao3');
insert into new (code,thumbnail,title,content,shortDescription)
values('NEWS SPORT4','img4','bản tin thể thao4', 'bản tin thể thao4','bản tin thể thao4');



#3
select users.id as userid,username,photos.id as photoid,count(likes.user_id) as numlikes from photos
join likes on likes.photo_id=photos.id
join users on photos.user_id=users.id group by photos.id order by numlikes desc limit 1;


#4
select tag_id,tag_name,count(tag_id) as count_tagused from photo_tags
join tags on tags.id=photo_tags.tag_id group by tag_id order by count_tagused desc limit 5;

#5
select dayname(created_at) as day_name, count(id) as num from users 
group by day_name order by num desc limit 1;



#6
select (select count(id) from photos) / (select count(id) from users) as average_nof_photos_per_user;


#7
select user_id,count(user_id) as numlikes from likes 
 group by user_id having numlikes=(select count(id) from photos);


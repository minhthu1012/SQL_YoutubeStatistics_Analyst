--What are the most commented-upon videos? Or the most liked?
select top 1 v.video_id, sum(v.comments) as sum_comments
from [videos-stats] as v
group by v.video_id
order by sum_comments desc

--How many total views does each category have? How many likes?
select v.keyword, SUM(v.views) as sum_views, SUM(v.likes) as total_likes
from [videos-stats] as v
group by Keyword

--What is the ratio of views/likes per category?
select v.video_id, v.keyword, sum(v.likes) OVER (partition by v.keyword) as total_likes
from [videos-stats] as v

--What is the ratio of views/likes per category?
With by_catergory 
AS(
select
	v.Keyword as category,
	sum(v.likes) as like_by_category
from 
	[videos-stats] as v
group by 
	v.Keyword) 

Select
	category,
	like_by_category,
	SUM(like_by_category) over() as total_like,
	round((like_by_category/(SUM(like_by_category) over())*100),2) as ratio
from by_catergory 

--What is the average sentiment score in each keyword category?
with video_statistics 
AS
(select c.Video_ID, c.Likes as comments_like, c.Sentiment, v.Title, v.Published_At, v.Keyword, v.Likes as likes_video, 
v.Comments as comments_video, v.Views
from comments as c 
join [videos-stats] as v on c.Video_ID = v.Video_ID)

select video_id, avg(sentiment) as avg_sentiment
from video_statistics 
group by category
# SQL_YoutubeStatistics_Analyst
**About Dataset**
The dataset contains two files for analyzing the relationship between the popularity of a certain video and the most relevant/liked comments of said video. 

**Data Description**
_videos-stats.csv:_
Title: Video Title.
Video ID: The Video Identifier.
Published At: The date the video was published in YYYY-MM-DD.
Keyword: The keyword associated with the video.
Likes: The number of likes the video received. If this value is -1, the likes are not publicly visible.
Comments: The number of comments the video has. If this value is -1, the video creator has disabled comments.
Views: The number of views the video got.

_comments.csv:_

Video ID: The Video Identifier.
Likes: The number of likes the comment received.
Sentiment: The sentiment of the comment. A value of 0 represents a negative sentiment, while values of 1 or 2 represent neutral and positive sentiments respectively.

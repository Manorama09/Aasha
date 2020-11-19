import tweepy
import time 
import datetime

consumer_key = 'iWhUBzn9SVGr1EBmEnA0pK5E8'
consumer_secret = 'gxRZ9LJs8LTAtlhWPNp7bpMAmiO1ZRa90cOpncmI0ZmkuK0MGs'
access_token = '1329028984613466113-s7czEe857YXKlP8BblgLw0HHcXB3CB'
access_token_secret = 'Vpny7AcnsdOkoiwDOdIMv6QGEQ8UppYUsfMs4CNQokzbs'

auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
api = tweepy.API(auth)

last_seen = None

user = api.me()
print ('\nUsername: '+user.name)
print ('\nUser ID: '+user.id_str)
print ('\nScreen Name: '+user.screen_name)

while True:

    twt = api.search(q="#pollution OR #globalwarming OR #climatechange OR #saveearth OR #wastemanagement",
                     count=5, tweet_mode='extended', since_id=last_seen) 
    
    if not twt:
        continue
    
    last_seen = twt[-1]._json['id'] - 1
    print(last_seen)
    
    '''for status in tweepy.Cursor(api.user_timeline).items():
       try:
           api.destroy_status(status.id)
       except:
           pass'''
                      
    for s in twt:        
       try:
           print('\nTweet by: @' + s.user.screen_name)

           # Retweet tweets as they are found
           s.retweet()
           print('Tweet Retweeted!')
       except tweepy.TweepError as e:
           print(e.reason)

       except StopIteration:
           break
       
       
    print("Exited.")    
    time.sleep(15)

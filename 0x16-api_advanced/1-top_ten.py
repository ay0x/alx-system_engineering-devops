#!/usr/bin/python3
"""
function that queries the Reddit API and prints the titles of the
first 10 hot posts listed for a given subreddit.
"""
import json
import requests


def top_ten(subreddit):
    """Return the first 10 hot posts listed for a given subreddit."""
    URL = "https://www.reddit.com/r/{}/hot/.json?limit=10".format(subreddit)
    headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36'}
    r = requests.get(URL, headers=headers)
    if r.status_code == 200:
        r = r.json()
        get = r.get('data').get('children')
        my_list = []
        for x in get:
            y = x.get("data")
            print(y.get("title"))
    else:
        print(None)

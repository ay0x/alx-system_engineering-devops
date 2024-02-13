#!/usr/bin/python3
"""
Function that queries the Reddit API and returns the number of subscribers
"""
import json
import requests


def number_of_subscribers(subreddit):
    """Return the number of subscribers"""
    URL = "https://www.reddit.com/r/{}/about/.json".format(subreddit)
    headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36'}
    r = requests.get(URL, headers=headers)
    if r.status_code == 200:
        r = r.json()
        return r['data']['subscribers']
    else:
        return 0

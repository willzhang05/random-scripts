#!/usr/bin/python3
## This script retrieves a set of trivia questions from opentdb.com. Used to generate trivia questions for a Hereford College trivia night.
import requests
import pprint
import urllib

API_URL="https://opentdb.com/api.php?amount=12&type=multiple&category=#&encode=url3986&difficulty=medium"
#categories=[1,9,10,11,12,14,15,16,18,19,23,25]
categories=[17]
print(len(categories))
for c in categories:
    url = API_URL.replace("#", str(c))
    r = requests.get(url)
    questions = r.json()
    results=questions["results"]
    for r in results:
        category = urllib.parse.unquote(r["category"])
        print("Category: ", category)
        print("Difficulty: ", r["difficulty"])
        question = r["question"]
        question = urllib.parse.unquote(question)
        #question.replace("&quot;", "\"")
        #question.replace("&#039;", "\'")
        print("Question: ", question)
        print("Correct Answer: ", urllib.parse.unquote(r["correct_answer"]))
        incorrect = ', '.join(r["incorrect_answers"])
        incorrect = urllib.parse.unquote(incorrect)
        print("Incorrect Answers: ", incorrect)
        print()

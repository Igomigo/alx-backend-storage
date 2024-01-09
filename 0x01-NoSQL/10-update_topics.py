#!/usr/bin/env python3
""" Contains a python function that updates a collection """


def update_topics(mongo_collection, name, topics):
    """ changes all topics of a school document based on the name """
    query = {"name": name}
    update = {"$set": {"topics": topics}}
    mongo_collection.update_many(query, update)

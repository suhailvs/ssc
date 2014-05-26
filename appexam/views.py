from django.shortcuts import render
from forum.models.tag import Tag
from forum.models.node import NodeContent
from forum.models.question import Question
import random,json
from urllib import unquote

from django.http import HttpResponse
from django.db import connection

# Create your views here.
def startquiz(request,tag):
	noQs=10
	tag = Tag.active.get(name=unquote(tag))    
	questions = Question.objects.filter(tags__id=tag.id)	
	quest_pks=[i.pk for i in questions]#[(i.pk,i.qtype) for i in questions]
	if len(quest_pks)>noQs:
		random.shuffle(quest_pks)
		quest_pks=quest_pks[:noQs]
	else:noQs=len(quest_pks)
	d={'questions':quest_pks,'min_left':noQs}
	return render(request,'exam/home.html',d)

def get_question(request):
	#myjs.js -> setQnQuestChoice -> /ajax/quest/
	query = 'SELECT body FROM forum_node WHERE id = %s' %request.GET['qpk']
	cursor = connection.cursor()
	cursor.execute(query)
	q=cursor.fetchone()
	n={'question':q[0]}	
	cursor.close()
	return HttpResponse(json.dumps(n), mimetype="application/json")

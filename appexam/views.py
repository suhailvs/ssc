from django.shortcuts import render
from forum.models.tag import Tag
from forum.models.node import NodeContent
from forum.models.question import Question
import random,json
from urllib import unquote

from django.http import HttpResponse
from django.db import connection

from appexam.models import OptCorrect,Score
from django.contrib.auth.decorators import login_required

# Create your views here.
@login_required
def startquiz(request,tag):
	noQs=10
	tag = Tag.active.get(name=unquote(tag))    
	questions = Question.objects.filter(tags__id=tag.id)	
	quest_pks=[i.pk for i in questions]#[(i.pk,i.qtype) for i in questions]
	if len(quest_pks)>noQs:
		random.shuffle(quest_pks)
		quest_pks=quest_pks[:noQs]
	else:noQs=len(quest_pks)

	cols=["#1ABC9C","#16A085","#2ECC71","#27AE60","#3498DB","#2980B9","#9B59B6","#8E44AD","#34495E","#2C3E50","#F1C40F","#F39C12","#E67E22","#D35400","#E74C3C","#C0392B","#ECF0F1","#BDC3C7","#95A5A6","#7F8C8D"]
	d={'questions':quest_pks,'min_left':noQs,'colors':cols,'tag':tag.name}
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

def save_opt(request):
	obj, created = OptCorrect.objects.get_or_create(question=request.GET['question'])
	obj.opt=int(request.GET['opt'])
	obj.save()
	return HttpResponse('Save in BACKEND successfully. --> quest: {opt.question}, option: {opt.opt}'.format(opt=obj))

@login_required
def submit_exam(request):
	if 'tag' in request.GET:		
		quests= json.loads(request.GET['questions'])
		c,w = OptCorrect.objects.check_exam(quests)
		s=Score(user=request.user,
			tag=request.GET['tag'],
			total_questions=request.GET['total_questions'],
			total_correct=c,
			total_wrong=w
			).save()
		print s	
		return HttpResponse('correct:{0},wrong:{1}'.format(c,w))
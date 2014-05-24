from django.shortcuts import render
from forum.models.tag import Tag
from forum.models.question import Question
import random
from urllib import unquote

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
	return render(request,'exams.html',d)

def exams(request):
	tg=Tag.objects.all()
	return render(request,'exams.html',{'tag':tg})
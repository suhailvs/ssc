from django.db import models
from django.contrib.auth.models import User

# Correct option for question
class OptCorrect(models.Model):
	question=models.IntegerField(max_length=10,unique=True)
	opt = models.IntegerField(max_length=1,default=0)

#"""Answers written by user"""
class Score(models.Model):
	user			= models.ForeignKey(User)
	tag				= models.CharField(max_length=100)
	started_time	= models.DateTimeField(auto_now_add=True)	
	finished_time	= models.DateTimeField(auto_now_add=True)	
	total_questions = models.IntegerField(max_length=3,default=0)
	total_correct	= models.IntegerField(max_length=3,default=0)		
	def __unicode__(self):
		return u"%s took the quiz: %s" % (self.user, self.tag)
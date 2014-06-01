from django.db import models
from django.contrib.auth.models import User


class OptCorrectManager(models.Manager):
	def check_exam(self,quests):
		correct = wrong = 0
		for key,value in quests.items():
			q=self.filter(question=key) #key --> question_id
			if q:
				#value --> selected option
				if q[0].opt == value: correct+=1
				else: wrong+=1
		return (correct,wrong)

# Correct option for question
class OptCorrect(models.Model):
	question=models.IntegerField(max_length=10,unique=True)
	opt = models.IntegerField(max_length=1,default=0)
	objects = OptCorrectManager()

#"""Answers written by user"""
class Score(models.Model):
	user			= models.ForeignKey(User)
	tag				= models.CharField(max_length=100)
	started_time	= models.DateTimeField(auto_now_add=True)	
	finished_time	= models.DateTimeField(auto_now_add=True)	
	total_questions = models.IntegerField(max_length=3,default=0)
	total_correct	= models.IntegerField(max_length=3,default=0)	
	total_wrong	= models.IntegerField(max_length=3,default=0)	
	def __unicode__(self):
		return u"%s took the quiz: %s" % (self.user, self.tag)

	@property
	def unattempted(self):
		return self.total_questions - self.total_correct - self.total_wrong
from django.conf.urls import patterns, include, url

urlpatterns = patterns('appexam.views',
	url(r'^ajax/quest/$','get_question',name='get_question'),
	url(r'^ajax/saveoption/$','save_opt',name='save_correctopt'),
	url(r'^(?P<tag>.*)/$','startquiz',name='quiz'),
)
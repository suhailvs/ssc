from django.conf.urls import patterns, include, url

urlpatterns = patterns('appexam.views',
	url(r'^(?P<tag>.*)/$','startquiz',name='quiz'),
)
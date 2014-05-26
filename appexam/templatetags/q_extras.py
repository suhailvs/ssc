from django import template
register = template.Library()
#from adminportal.models import Choices

@register.simple_tag
def buttons_tag(n,quests):
	#question id and type are stored in buttons for later usage
	nrows=n/5
	lastrow=n%5
	str_outp=""
	str_btn='''<button class="btn btn-nav-quests btnnav" style="width:40px;" 
			id="btn-nav{0}" data-qpk="{1}" data-opt="0">{0}</button>'''

	for i in range(nrows):
		str_outp+='<div class="btn-group">'
		for j in range(5):
			k=i*5+j+1#k starts from 1			
			str_outp+=str_btn.format(k,quests[k-1])			
		str_outp+='</div><br>'
	if lastrow:
		str_outp+='<div class="btn-group">'
		for i in range(lastrow):
			k=5*nrows+i+1			
			str_outp+=str_btn.format(k,quests[k-1])
		str_outp+='</div><br>'
	return str_outp
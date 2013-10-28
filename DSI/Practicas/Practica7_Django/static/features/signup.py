import urllib2
from lxml import html
from lettuce import step, world
from lettuce.django import django_url

@step('I access to the url "(/signup)"')
def i_access_to_the_url_signup(step, url):
    url = django_url(url)
    raw = urllib2.urlopen(url).read()
    world.dom = html.fromstring(raw)

@step('I see the header "(Sign up)"')
def i_see_the_header_signup(step, text):
    header = world.dom.cssselect('h1')[0]

@step('I look inside the 1st paragraph')
def when_i_look_inside_of_the_1st_paragraph(step):
    world.element = world.dom.cssselect("p")[0]

import urllib2
from lxml import html
from lettuce import step, world
from lettuce.django import django_url

@step('I access the url "(/about)"')
def navigate_to_url(step, url):
    url = django_url(url)
    raw = urllib2.urlopen(url).read()
    world.dom = html.fromstring(raw)
    #world.browser.get(full_url)

@step('I see the header "(About)"')
def see_header(step, text):
    header = world.dom.cssselect('h1')[0]

@step(r'I look inside the paragraph_about')
def when_i_look_inside_the_paragraph_about(step):
    world.element = world.dom.cssselect("p")[0]


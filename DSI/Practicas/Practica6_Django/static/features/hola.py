import urllib2
from lxml import html
from lettuce import step, world
from lettuce.django import django_url

@step('I access the url "(/hola)"')
def navigate_to_url(step, url):
    url = django_url(url)
    raw = urllib2.urlopen(url).read()
    world.dom = html.fromstring(raw)
    #world.browser.get(full_url)

@step('I see the header "(Hola)"')
def see_header(step, text):
    header = world.dom.cssselect('h1')[0]
    


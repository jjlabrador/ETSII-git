import urllib2
from lxml import html
from lettuce import step, world
from lettuce.django import django_url

@step('I access the url "(/help)"')
def navigate_to_url(step, url):
    url = django_url(url)
    raw = urllib2.urlopen(url).read()
    world.dom = html.fromstring(raw)
    #world.browser.get(full_url)

@step('I see the header "(Help)"')
def see_header(step, text):
    header = world.dom.cssselect('h1')[0]

@step(r'I look inside de 1st paragraph')
def when_i_look_inside_de_1st_paragraph(step):
    world.element = world.dom.cssselect("p")[0]


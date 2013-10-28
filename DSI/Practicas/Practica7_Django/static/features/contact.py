import urllib2
from lxml import html
from lettuce import step, world
from lettuce.django import django_url

@step('I access to the url of contact "(/contact)"')
def i_access_to_the_url_of_contact(step, url):
    url = django_url(url)
    raw = urllib2.urlopen(url).read()
    world.dom = html.fromstring(raw)
    #world.browser.get(full_url)

@step('I see the header of contact "(Contact)"')
def i_see_the__header_of_contact(step, text):
    header = world.dom.cssselect('h1')[0]

@step(r'I look inside of contact 1st paragraph_contact')
def when_i_look_inside_of_contact_1st_paragraph_contact(step):
    world.element = world.dom.cssselect("p")[0]



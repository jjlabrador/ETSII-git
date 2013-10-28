from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'Practica5_Django.views.home', name='home'),
    # url(r'^Practica5_Django/', include('Practica5_Django.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)

urlpatterns += patterns('django.contrib.flatpages.views',
    url(r'^hola/$', 'flatpage', {'url': '/hola/'}, name='hola'),
    url(r'^home/$', 'flatpage', {'url': '/home/'}, name='home'),
    url(r'^help/$', 'flatpage', {'url': '/help/'}, name='help'),
    url(r'^about/$', 'flatpage', {'url': '/about/'}, name='about'),
)

# inicio/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('vendas/', views.vendas, name='vendas'),
    path('sobre/', views.sobre, name='sobre'),
]
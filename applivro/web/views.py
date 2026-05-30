from django.shortcuts import render

# Create your views here.

def index(request):
    return render(request, 'index.html', {})

def vendas(request):
    return render(request, 'vendas.html', {})

def sobre(request):
    return render(request, 'sobre.html', {})
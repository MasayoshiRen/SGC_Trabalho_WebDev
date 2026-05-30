from django.db import models

# Create your models here.

class Produto(models.Model):
    nome = models.CharField(max_lengh=100)
    preco = models.DecimalField(max_digits=6, decimal_places=2)


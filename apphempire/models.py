# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Derivados(models.Model):
    id_derivado = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=255, blank=True, null=True)
    producto = models.ForeignKey('Productos', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Derivados'


class Flores(models.Model):
    id_flores = models.AutoField(primary_key=True)
    cepa = models.CharField(max_length=255, blank=True, null=True)
    tipo = models.CharField(max_length=255, blank=True, null=True)
    porcent_comp = models.DecimalField(max_digits=5, decimal_places=2, blank=True, null=True)
    producto = models.ForeignKey('Productos', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Flores'


class Parafernalia(models.Model):
    id_parafernalia = models.AutoField(primary_key=True)
    marca = models.CharField(max_length=255, blank=True, null=True)
    producto = models.ForeignKey('Productos', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Parafernalia'


class Productos(models.Model):
    nombre = models.CharField(max_length=255, blank=True, null=True)
    precio = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    descripcion = models.CharField(max_length=3000, blank=True, null=True)
    img = models.CharField(max_length=1000, blank=True, null=True)
    stock = models.IntegerField(blank=True, null=True)
    numvendidos = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Productos'


class Semillas(models.Model):
    id_semillas = models.AutoField(primary_key=True)
    cepa = models.CharField(max_length=255, blank=True, null=True)
    tipo = models.CharField(max_length=255, blank=True, null=True)
    producto = models.ForeignKey(Productos, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Semillas'


class Usuarios(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=255, blank=True, null=True)
    contraseña = models.CharField(max_length=255, blank=True, null=True)
    correo = models.CharField(max_length=255, blank=True, null=True)
    edad = models.IntegerField(blank=True, null=True)
    nombre = models.CharField(max_length=255, blank=True, null=True)
    apellidos = models.CharField(max_length=255, blank=True, null=True)
    fechareg = models.DateField(blank=True, null=True)
    token = models.CharField(max_length=1000, blank=True, null=True)
    class Meta:
        managed = False
        db_table = 'Usuarios'

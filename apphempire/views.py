from django.shortcuts import render
from .models import Usuarios, Derivados , Parafernalia, Flores,Semillas 
from django.http import HttpResponse
from django.http import JsonResponse
from django.contrib.auth.hashers import make_password
from django.db.models import Count
from django.views.decorators.csrf import csrf_exempt
import json
from datetime import datetime
# Create your views here.
@csrf_exempt
def registro(request):
    data = json.loads(request.body)
    edadobli =data.get("edad")
    nombreusuario =  data.get("username") 
    correoelc =  data.get("correo") 
    fecharegistro = datetime.now()
    print(nombreusuario)
    queryUsuarios = Usuarios.objects.filter(username = nombreusuario ).count()
    queryCorreo = Usuarios.objects.filter(correo = correoelc ).count()
    
    if request.method !="POST":
        return JsonResponse({ "error": "Metodo HTTP no soportado"})
    elif nombreusuario == "" or data.get("contraseña") == ""or data.get("repcontraseña")=="" or correoelc == ""  or data.get("nombre") == "" or data.get("apellidos") == "" or data.get("edad") == "": 
        return JsonResponse({"error": "Esta vacio un campo"}, status=201)

    elif request.POST.get("contraseña") !=  request.POST.get("repcontraseña"):
        return JsonResponse({ "error":"Las contraseñas no coinciden"})
    elif  queryUsuarios > 0 :
        return JsonResponse({"error":"Este nombre de ya esta registrado"})
    elif  edadobli < 18 :
        return JsonResponse({"error":"Es menor de edad"})
    elif  queryCorreo > 0 :
        return JsonResponse({"error":"Este correo ya esta de ya esta registrado"})
    else:
     
        
      
        passwd_sinhashear = data.get("contraseña")
        passwd_hashed=make_password(passwd_sinhashear)
        Nuevousuario= Usuarios(username=nombreusuario ,contraseña=passwd_hashed,correo= correoelc,edad=edadobli,nombre= data.get("nombre"),apellidos=data.get("apellidos"),fechareg=fecharegistro )
        Nuevousuario.save()
    return JsonResponse({"Estado":"Registrado correctamente"})

       
@csrf_exempt
def login_logout(request):
  if request.method == "PATCH":
    token = request.headers.get("SessionToken", None)
    if token is None:
      return JsonResponse({"error": "Missing Token"}, status=401)
    return JsonResponse({"status": "success"})
  elif request.method == "POST":
    return JsonResponse({"sessionToken": "abc"}, status=201)
  else:
    return JsonResponse({"error": "No mandaste un PATCH ni un POST"}, status=405)
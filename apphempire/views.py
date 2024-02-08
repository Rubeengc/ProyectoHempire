from django.shortcuts import render
from .models import Usuarios, Derivados , Parafernalia, Flores,Semillas 
from django.http import HttpResponse
from django.http import JsonResponse
from django.contrib.auth.hashers import make_password
from django.db.models import Count
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.hashers import check_password
import json
import jwt
import datetime
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

    elif data.get("contraseña") !=  data.get("repcontraseña"):
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
def generar_jwt_token(request,id):
  payload = {
    'id' : id,
    'exp': datetime.datetime.utcnow() + datetime.timedelta(days=1), 
    'iat': datetime.datetime.utcnow(),
  }
  token = jwt.encode(payload, 'clave_authz', algorithm='HS256')
  return token


@csrf_exempt
def login(request):
  if request.method != "PATCH":
    return JsonResponse({"error": "Metodo HTTP no soportado"}, status=405) 
  else:
    data = json.loads(request.body)
    nombreusuarioenv =  data.get("username") 
    contraseñaenv= data.get("contraseña")
    print(nombreusuarioenv)
    print(contraseñaenv)
    queryUser =Usuarios.objects.get(username=nombreusuarioenv)
    contraseñaguardada =queryUser.contraseña
    print(contraseñaguardada)
    if queryUser == None:
        return JsonResponse({"error": "No estas registrado"}, status=405)
    else:
      if check_password(contraseñaenv,contraseñaguardada):
        tokenn=generar_jwt_token(request,queryUser.id)
        queryUser.token = tokenn
        queryUser.save()
        return JsonResponse({"token":tokenn})
      else:
        return JsonResponse({"error": "La contraseña no es correcta"}, status=405)


from django.shortcuts import render
from .models import Usuarios, Derivados , Parafernalia, Flores,Semillas,Productos 
from django.http import HttpResponse
from django.http import JsonResponse
from django.contrib.auth.hashers import make_password
from django.db.models import Count
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.hashers import check_password
from django.core.paginator import Paginator
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
    fecharegistro = datetime.datetime.now()
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
def verificacion_token(request):
   token =request.META.get('HTTP_AUTHORIZATION',None)
   if not token:
      return JsonResponse({'error':'Falta el token'},status=401),None
   try:
      if token.startswith('Bearer '):
         token = token.split()[1]
      payload =jwt.decode(token,'clave_authz',algorithms=['HS256'])
      return None,payload
   except jwt.ExpiredSignatureError:
      return JsonResponse({'error':'El token a expirado'},status=401),None
   except jwt.InvalidTokenError:
      return JsonResponse({'error':'El token no es valido'},status=401),None

@csrf_exempt
def login(request):
  if request.method != "PATCH":
    return JsonResponse({"error": "Metodo HTTP no soportado"}, status=405) 
  else:
    data = json.loads(request.body)
    nombreusuarioenv =  data.get("username") 
    contraseñaenv= data.get("contraseña")
    queryUser =Usuarios.objects.get(username=nombreusuarioenv)
    contraseñaguardada =queryUser.contraseña
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

@csrf_exempt
def logout(request):
  error_reponse, payload =verificacion_token(request)
  if error_reponse:
     return error_reponse
  if request.method != "PATCH":
    return JsonResponse({"error": "Metodo HTTP no soportado"}, status=405) 
  try:
    usuario=Usuarios.objects.get(id=payload["id"])
    usuario.token = None
    usuario.save()
    return JsonResponse({'error':'Sesion Cerrada con éxito'},status=200)
  except Usuarios.DoesNotExist:
     return JsonResponse({'error':'Usuario no encontrado'},status=404)
@csrf_exempt
def producto(request,producto_id):
    producto=Productos.objects.get(pk=producto_id)
    print(producto)
    if request.method != "GET":
      return JsonResponse({"error": "Metodo HTTP no soportado"}, status=405)
    if producto != None:
       
       return JsonResponse({"nombre": producto.nombre ,"descripcion": producto.descripcion ,"precio": producto.precio ,"stock": producto.stock ,"imagen": producto.img}, status=200)
    else:
      return JsonResponse({"error": "Ese producto no existe"}, status=405)
@csrf_exempt
def list_producto(request):
   if request.method == 'GET':
      productos_query = Productos.objects.all()
      busqueda_query = request.GET.get('search',None)
      if busqueda_query :
         productos_query = productos_query.filter(nombre__icontains=busqueda_query)
      sort_by = request.GET.get('sort','nombre')
      productos_query = productos_query.order_by(sort_by)
      paginator = Paginator(productos_query, request.GET.get('limit',10))
      page =request.GET.get('page',1)
      productos = paginator.get_page(page)
      productos_data =[
         {
            'nombre':producto.nombre,
            'precio':producto.precio,
            'img':producto.img,
            'stock':producto.stock
         }for producto in productos
      ]
      return JsonResponse({'productos':productos_data,'total':paginator.count, 'page':page},status=200)
@csrf_exempt
def devolver_productos_en_carrito(request):
  error_reponse, payload =verificacion_token(request)
  if error_reponse:
     return error_reponse
  if request.method != "GET":
      return JsonResponse({"error": "Metodo HTTP no soportado"}, status=405)
    # Obtener el ID del usuario a partir del token de sesión
  id_user=Usuarios.objects.get(id=payload["id"])
    # Obtener todos los productos en el carrito del usuario
  productos_en_carrito = Carrito.objects.filter(id_user=usuario_id)
    # Crear una lista para almacenar la información de los productos en el carrito
  productos_carrito_info = []
    # Obtener la información relevante de cada producto en el carrito
  for producto_carrito in productos_en_carrito:
        producto = producto_carrito.producto
        producto_info = {
            'id': producto.id,
            'nombre': producto.nombre,
            'precio': str(producto.precio),
            'stock': producto.stock,
            'img': producto.img
        }
        productos_carrito_info.append(producto_info)
  return JsonResponse(productos_carrito_info, safe=False)

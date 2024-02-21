"""
URL configuration for proyectohempire project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from apphempire import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('registro', views.registro),
    path('login', views.login),
    path('logout',views.logout),
    path('producto/<int:producto_id>',views.producto),
    path('productos/',views.list_producto),
    path('carrito/',views.devolver_productos_en_carrito),
    path('producto/<int:producto_id>/carrito',views.agregar_producto_al_carrito)
]

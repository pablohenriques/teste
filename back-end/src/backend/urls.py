from rest_framework import routers
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token

from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from django.views.generic import RedirectView

from core.api import viewsets as viewsets_core
from profissional.api import viewsets as viewsets_profissional


router = routers.DefaultRouter()

# core routers
router.register(r'users', viewsets_core.UserViewSet, basename='users')
router.register(r'groups', viewsets_core.GroupViewSet, basename='groups')
router.register(r'perfis', viewsets_core.PerfilViewSet, basename='perfis')
router.register(r'publicacoes', viewsets_core.PublicacaoViewSet, basename='publicacoes')
router.register(
    r'perfil-logado',
    viewsets_core.PerfilLogadoViewSet,
    basename='perfil-logado'
)

# profissional routers
router.register(
    r'oportunidades',
    viewsets_profissional.OportunidadeViewSet,
    basename='oportunidades'
)
router.register(
    r'avaliacoes',
    viewsets_profissional.AvaliacaoViewSet,
    basename='avaliacao'
)


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path(
        'api/auth/',
        include(
            'rest_framework.urls',
            namespace='rest_framework'
        )
    ),
    path(r'api/token-auth/', obtain_jwt_token),
    path(r'api/token-refresh/', refresh_jwt_token),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

urlpatterns += [
    path('favicon.ico', RedirectView.as_view(
        url='/static/img/favicon.ico', permanent=True))
]

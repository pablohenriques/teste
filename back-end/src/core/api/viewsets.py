from core.models import Publicacao
from rest_framework import filters
from rest_framework import permissions
from rest_framework import viewsets, generics

from django.contrib.auth.models import User, Group

from core.models import Perfil
from core.api.serializers import (
    UserSerializer,
    GroupSerializer,
    PerfilSerializer,
    PublicacaoSerializer
)
from rest_framework.response import Response


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['username', 'email']
    permission_classes = [permissions.IsAuthenticated]


class GroupViewSet(viewsets.ModelViewSet):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    permission_classes = [permissions.IsAdminUser]


class PerfilLogadoViewSet(viewsets.ModelViewSet):
    """Endpoint que permite obter e cadastrar um perfil para o usuário logado"""
    serializer_class = PerfilSerializer

    def get_queryset(self):
        return Perfil.objects.filter(user=self.request.user)

    def list(self, request, *args, **kwargs):
        perfil = self.get_queryset()
        if perfil.exists():
            serializer = self.get_serializer(perfil.first())
            return Response(serializer.data)
        else:
            return Response(None, status=404)


class PerfilViewSet(viewsets.ModelViewSet):
    """Endpoint que permite recuperar e editar informações sobre perfis de usuários."""
    serializer_class = PerfilSerializer
    queryset = Perfil.objects.all()
    filterset_fields = ['user', 'uf', 'cidade']
    search_fields = [
        'user__username',
        'user__email',
        'nome',
        'telefone',
        'estado_uf',
        'cidade',
        'cep',
    ]
    permission_classes = [permissions.IsAdminUser]

class PublicacaoViewSet(viewsets.ModelViewSet):
    serializer_class = PublicacaoSerializer
    queryset = Publicacao.objects.all()
    filterset_fields = []
    search_fields = [
        'titulo',
        'descricao',
        'comentario_ativo',
        'ativo',
        'criado_em',
        'atualizado_em'
    ]
from rest_framework import serializers

from django.contrib.auth.models import User, Group, Permission

from core.models import *


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'groups']


class TokenSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email']


class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ['name']


class PermissionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Permission
        fields = '__all__'


class PerfilSerializer(serializers.ModelSerializer):
    class Meta:
        model = Perfil
        fields = [
            'id',
            'user',
            'nome',
            'sobre',
            'sexo',
            'telefone',
            'pais',
            'uf',
            'cidade',
            'foto',
            'ativo',
            'criado_em',
            'atualizado_em',
        ]
        read_only_fields = ['criado_em', 'atualizado_em']


class PublicacaoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Publicacao
        fields = [
            'titulo',
            'descricao',
            'comentario_ativo',
            'ativo',
            'criado_em',
            'atualizado_em'
        ]
from rest_framework import viewsets, generics, serializers

from profissional.api.serializers import (
    AvaliacaoSerializer,
    OportunidadeSerializer,
)
from profissional.models import Oportunidade, Avaliacao


class OportunidadeViewSet (viewsets.ModelViewSet):
    queryset = Oportunidade.objects.all()
    data_expiracao = serializers.DateField(format="%Y-%m-%d %H:%M:%S")
    criado_em = serializers.DateField(format="%Y-%m-%d %H:%M:%S")
    serializer_class = OportunidadeSerializer


class AvaliacaoViewSet (viewsets.ModelViewSet):
    queryset = Avaliacao.objects.all()
    serializer_class = AvaliacaoSerializer

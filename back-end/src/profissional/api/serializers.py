from rest_framework import serializers

from profissional.models import Oportunidade, Avaliacao


class OportunidadeSerializer(serializers.ModelSerializer):

    class Meta:
        model = Oportunidade
        fields = [
            'id',
            'titulo',
            'descricao',
            'local',
            'ativo',
            'categoria',
            'comentario_ativo',
            'data_expiracao',
            'criado_em',
            'atualizado_em',
        ]
        read_only_fields = ['criado_em', 'atualizado_em', ]


class AvaliacaoSerializer(serializers.ModelSerializer):

    class Meta:
        model = Avaliacao
        fields = [
            'id',
            'avaliado',
            'avaliador',
            'descricao',
            'publico',
            'ativo',
            'criado_em',
            'atualizado_em',
        ]
        read_only_fields = ['criado_em', 'atualizado_em', ]

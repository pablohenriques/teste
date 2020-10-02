from django.db import models

from core.models import Publicacao, Aluno, Professor
from core.consts import OportunidadeChoices


class Oportunidade(Publicacao):
    """Esta classe representa as informações de uma Oportunidade."""

    local = models.CharField(max_length=128)
    categoria = models.CharField(
        max_length=32,
        choices=OportunidadeChoices.choices,
    )
    data_expiracao = models.DateField('Data Expiração')

    class Meta:
        """Meta definition for Oportunidade."""

        verbose_name = 'Oportunidade'
        verbose_name_plural = 'Oportunidades'

    def __str__(self):
        """Unicode representation of Oportunidade."""
        return self.titulo


class Avaliacao(models.Model):
    """Esta classe representa as informações de uma Avaliacao."""

    avaliado = models.ForeignKey(Aluno, on_delete=models.PROTECT)
    avaliador = models.ForeignKey(Professor, on_delete=models.PROTECT)
    descricao = models.TextField('Descrição')
    publico = models.BooleanField(default=True)
    ativo = models.BooleanField(default=True)
    criado_em = models.DateTimeField('Criado em', auto_now_add=True)
    atualizado_em = models.DateTimeField('Atualizado em', auto_now=True)

    class Meta:
        """Meta definition for Avaliacao."""

        verbose_name = 'Avaliacão'
        verbose_name_plural = 'Avaliacões'

    def __str__(self):
        """Unicode representation of Avaliacao."""
        return f'avaliado: {self.avaliado}; avaliador: {self.avaliador}'

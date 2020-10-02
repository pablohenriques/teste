from django.db import models
from django.contrib.auth.models import User
from django.utils.text import slugify

from core.consts import (
    SexoChoices,
    FuncaoChoices,
)
from core.utils import perfil_document_upload


class Perfil(models.Model):
    """Esta classe representa as informações do Perfil de um usuário,
    ou seja, os dados da pessoa associada ao usuário."""

    user = models.OneToOneField(User, on_delete=models.PROTECT)
    nome = models.CharField(max_length=128, db_index=True)
    sobre = models.TextField(null=True, blank=True)
    sexo = models.CharField(
        null=True,
        max_length=16,
        choices=SexoChoices.choices,
    )
    telefone = models.CharField(null=True, max_length=15)
    pais = models.CharField(null=True, max_length=64)
    uf = models.CharField(null=True, max_length=2)
    cidade = models.CharField(null=True, max_length=64)
    foto = models.ImageField(
        null=True,
        blank=True,
        upload_to=perfil_document_upload,
    )
    ativo = models.BooleanField(default=True)
    criado_em = models.DateTimeField(auto_now_add=True)
    atualizado_em = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'Perfil'
        verbose_name_plural = 'Perfis'

    def __str__(self):
        """Unicode representation of Perfil."""
        return f"{self.nome} ({self.user.username})"


class Curso(models.Model):
    """Esta classe representa as informações de um Curso."""

    nome = models.CharField(max_length=256, db_index=True, unique=True)
    slug = models.SlugField(max_length=256)
    ativo = models.BooleanField(default=True)
    criado_em = models.DateTimeField(auto_now_add=True)
    atualizado_em = models.DateTimeField(auto_now=True)

    def save(self, force_insert=False, force_update=False,
             using=None, update_fields=None):
        self.slug = slugify(self.nome)
        super(Curso, self).save(
            force_insert, force_update, using, update_fields)

    class Meta:
        """Meta definition for Curso."""

        verbose_name = 'Curso'
        verbose_name_plural = 'Cursos'

    def __str__(self):
        """Unicode representation of Curso."""
        return self.nome


class Aluno(models.Model):
    """Esta classe representa as informações de um aluno
    (uma pessoa com quem a instituição de ensino tem vínculo estudantil)."""

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    nome = models.CharField(max_length=256, db_index=True)
    cgu = models.IntegerField(unique=True)
    ativo = models.BooleanField(default=True)
    criado_em = models.DateTimeField(auto_now_add=True)
    atualizado_em = models.DateTimeField(auto_now=True)

    class Meta:
        """Meta definition for Aluno."""

        verbose_name = 'Aluno'
        verbose_name_plural = 'Alunos'

    def __str__(self):
        """Unicode representation of Aluno."""
        return f'{self.nome} ({self.user})'


class Professor(models.Model):
    """Esta classe representa informações de um professor, ou seja,
    quando um funcionário está relacionado a um curso com a função de
    professor ou coordenador de curso."""

    user = models.OneToOneField(User, models.CASCADE)
    curso = models.ForeignKey(Curso, on_delete=models.CASCADE)
    nome = models.CharField(max_length=128, db_index=True)
    cgu = models.IntegerField(unique=True)
    funcao = models.CharField(max_length=64, choices=FuncaoChoices.choices)
    ativo = models.BooleanField(default=True)
    criado_em = models.DateTimeField(auto_now_add=True)
    atualizado_em = models.DateTimeField(auto_now=True)

    class Meta:
        """Meta definition for Professor."""

        verbose_name = 'Professor'
        verbose_name_plural = 'Professores'
        unique_together = ['id', 'curso', 'funcao']

    def __str__(self):
        """Unicode representation of Professor."""
        return f'{self.curso} - {self.nome} ({self.get_funcao_display()})'


class Turma(models.Model):
    """Esta classe representa as informações de uma Turma."""

    professores = models.ManyToManyField(Professor)
    alunos = models.ManyToManyField(Aluno)
    ano = models.PositiveSmallIntegerField()
    semestre = models.PositiveSmallIntegerField()
    descricao = models.CharField('Descrição', max_length=128)
    ativo = models.BooleanField(default=True)
    criado_em = models.DateTimeField(auto_now_add=True)
    atualizado_em = models.DateTimeField(auto_now=True)

    class Meta:
        """Meta definition for Turno."""

        verbose_name = 'Turma'
        verbose_name_plural = 'Turmas'

    def __str__(self):
        """Unicode representation of Turma."""
        return f'{self.ano}/{self.semestre}'


class Linguagem(models.Model):
    """Esta classe representa as informações de uma Linguagem."""
    nome = models.CharField(max_length=16)

    class Meta:
        """Meta definition for Linguagem."""

        verbose_name = 'Linguagem'
        verbose_name_plural = 'Linguagens'

    def __str__(self):
        """Unicode representation of Linguagem."""
        return self.nome


class Publicacao(models.Model):
    """Esta classe representa as informações de uma Publicacao."""

    titulo = models.CharField(max_length=128, db_index=True)
    descricao = models.TextField()
    comentario_ativo = models.BooleanField(default=True)
    ativo = models.BooleanField(default=True)
    criado_em = models.DateTimeField('Criado em', auto_now_add=True)
    atualizado_em = models.DateTimeField('Atualizado em', auto_now=True)

    class Meta:
        """Meta definition for Publicacao."""

        verbose_name = 'Publicacão'
        verbose_name_plural = 'Publicacões'

    def __str__(self):
        """Unicode representation of Publicacao."""
        return self.titulo

from django.db.models import TextChoices


class SexoChoices(TextChoices):
    MASCULINO = 'masculino', 'Masculino'
    FEMININO = 'feminino', 'Feminino'
    OUTROS = 'outros', 'Outros'


class OportunidadeChoices(TextChoices):
    ESTAGIO = 'estagio', 'Estágio'
    CLT = 'clt', 'CLT'
    PJ = 'pj', 'PJ'
    MESTRADO = 'mestrado', 'Mestrado'
    DOUTORADO = 'doutorado', 'Doutorado'
    EVENTO = 'evento', 'Evento'
    FREELANCER = 'freelancer', 'Freelancer'


class FuncaoChoices(TextChoices):
    PROFESSOR = 'professor', 'Professor'
    COORDENADOR = 'coordenador', 'Coordenador de curso'

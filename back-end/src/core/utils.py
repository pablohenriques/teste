from os import path
from django.utils.text import slugify


def perfil_document_upload(instance, filename):
    name, ext = path.splitext(filename)
    return path.join(
        'perfil', '%s%s' % (slugify(name), ext)
    )

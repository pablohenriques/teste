from core.api.serializers import TokenSerializer


def jwt_response_payload_handler(token, user=None, request=None):
    return {
        'token': token,
        **TokenSerializer(user, context={'request': request}).data,
    }

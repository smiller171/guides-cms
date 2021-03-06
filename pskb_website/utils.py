"""
Generic functions for global use
"""

import re
from unicodedata import normalize

_punct_re = re.compile(r'[\t !"#$%&\'()*\-/<=>?@\[\\\]^_`{|},.:]+')


# From http://flask.pocoo.org/snippets/5/
def slugify(text, delim=u'-'):
    """Generates an slightly worse ASCII-only slug."""

    result = []

    for word in _punct_re.split(text.lower()):
        word = normalize('NFKD', word).encode('ascii', 'ignore')
        if word:
            result.append(word)

    return unicode(delim.join(result))

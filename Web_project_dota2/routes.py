"""
Routes and views for the bottle application.
"""
import re
from bottle import Bottle, route, view, request, template
from datetime import datetime

comments = []
mail_pattern = r'^[a-zA-Z0-9._]+@[a-zA-z0-9.-]+\.[a-zA-Z]{2,}$'

app = Bottle()
@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        year=datetime.now().year
    )

@route('/contact')
@view('contact')
def contact():
    """Renders the contact page."""
    return dict(
        title='Contact',
        message='Your contact page.',
        year=datetime.now().year
    )

@route('/about')
@view('about')
def about():
    """Renders the about page."""
    return dict(
        title='About',
        message='Your application description page.',
        year=datetime.now().year
    )

@route('/weapon')
@view('weapon')
def weapon():
    return dict(
        year=datetime.now().year
    )

@route('/armor')
@view('armor')
def armor():
    return dict(
        year=datetime.now().year
    )

@route('/magic')
@view('magic')
def magic():
    return dict(
        year=datetime.now().year
    )

@route('/actualnews')
@view('actualnews')
def actualnews():
    """Renders the actualnews page."""
    return dict(
        year=datetime.now().year,
        comments=comments
    )

@route('/comment', method='POST')
def add_comment():
    nickname = request.forms.get('nickname')
    comment = request.forms.get('comment')
    if re.match(mail_pattern, nickname):
        
        comments.append({'nickname': nickname, 'comment': comment})
        return actualnews()  # Обновление страницы с комментариями
    else:
        nickname = "ANON"
        comments.append({'nickname': nickname, 'comment': comment})
        return actualnews()  # Обновление страницы с комментариями

@route('/get_comments')
def get_comments():
    return template('comments_template', comments=comments, layout=False)
